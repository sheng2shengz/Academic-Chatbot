using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Academic_Chatbot
{
    public partial class Login : System.Web.UI.Page
    {
        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string MD5Encrypt(string password)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] encrypt;
            UTF8Encoding encode = new UTF8Encoding();
            encrypt = md5.ComputeHash(encode.GetBytes(password));
            StringBuilder encryptdata = new StringBuilder();
            for (int i = 0; i < encrypt.Length; i++)
                encryptdata.Append(encrypt[i].ToString());
            return encryptdata.ToString();
        }

        protected void SignIn_Button_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            string encrypt_passwordinput = MD5Encrypt(Password_TextBox.Text);
            string query = "SELECT email_address, passwordhash FROM [user] WHERE email_address ='" + EmailAddress_TextBox.Text + "'AND passwordhash ='" + encrypt_passwordinput + "'";
            string userType = "SELECT role_ID FROM [user] WHERE email_address ='" + EmailAddress_TextBox.Text + "'AND passwordhash ='" + encrypt_passwordinput + "'";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
            {
                Session["userType"] = GetUserType();
                Session["UserId"] = GetUserId();
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                upModal.Update();
            }
        }

        public string GetUserType()
        {
            string SelectSQL = "SELECT role_ID FROM [user] WHERE email_address ='" + EmailAddress_TextBox.Text + "'";
            string type = "";

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand SQLCmd = new SqlCommand(SelectSQL, conn))
                {
                    conn.Open();
                    type = ((int)SQLCmd.ExecuteScalar()).ToString();
                }
            }
            return type;
        }

        public string GetUserId()
        {
            string SelectSQL = "SELECT user_id FROM [user] WHERE email_address ='" + EmailAddress_TextBox.Text + "'";
            string userId;

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand SQLCmd = new SqlCommand(SelectSQL, conn))
                {
                    conn.Open();
                    userId = ((int)SQLCmd.ExecuteScalar()).ToString();
                }
            }
            return userId;
        }
    }
}