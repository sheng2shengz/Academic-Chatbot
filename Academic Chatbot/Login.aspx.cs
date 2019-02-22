using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Academic_Chatbot
{
    public partial class Login : System.Web.UI.Page
    {
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
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-AR8MJRC\SQLEXPRESS;Initial Catalog=academic_chatbot;Integrated Security=True");
            string encrypt_passwordinput = MD5Encrypt(Password_TextBox.Text);
            string query = "SELECT email_address, passwordhash FROM [user] WHERE email_address ='" + EmailAddress_TextBox.Text + "'AND passwordhash ='" + encrypt_passwordinput + "'";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count >= 1)
                Response.Redirect("Dashboard.aspx");
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                upModal.Update();
            }
                
        }
    }
}