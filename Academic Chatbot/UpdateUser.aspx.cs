using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        int userId = 0;

        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["user_id"] != "")
            {
                userId = Convert.ToInt16(Request.QueryString["user_id"]);
            }
            else
                Response.Redirect("User.aspx");

            if (!IsPostBack)
            {
                FillUserData();
            }
        }

        protected void back_ImageButton_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("User.aspx");
        }

        private void FillUserData()
        {
            UserFunc user = new UserFunc();

            user = user.GetUserData(ConnectionString, userId);

            Title_DropDownList.Text = user.Title;
            FirstName_TextBox.Text = user.FirstName;
            LastName_TextBox.Text = user.LastName;
            Email_TextBox.Text = user.EmailAddress;
            Role_DropDownList.Text = user.Role;
        }

        protected void Submit_Button_Click(object sender, EventArgs e)
        {

            Encryption Encryp = new Encryption();
            string EncrypPassword = Encryp.MD5Encrypt(Password_TextBox.Text);

            UserFunc User = new UserFunc();
            User.UserId = userId;
            User.Title = Title_DropDownList.Text;
            User.FirstName = FirstName_TextBox.Text;
            User.LastName = LastName_TextBox.Text;
            User.EmailAddress = Email_TextBox.Text;
            User.Passwordhash = EncrypPassword;
            if (Role_DropDownList.Text == "Admin")
                User.Role = "1";
            else if (Role_DropDownList.Text == "FYP Coordinator")
                User.Role = "2";
            else if (Role_DropDownList.Text == "LI Coordinator")
                User.Role = "3";

            if (Password_TextBox.Text == "" && ConfirmPassword_TextBox.Text == "")
                User.EditUserWithoutPassword(ConnectionString, User);
            else
                User.EditUserWithPassword(ConnectionString, User);

            Response.Redirect("User.aspx");
        }
    }
}