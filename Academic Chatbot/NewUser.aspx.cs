﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class NewUser : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void back_ImageButton_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Accounts.aspx");
        }

        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

         protected void Submit_Button_OnClick(object sender, EventArgs e)
         {
            Encryption encrypt       = new Encryption();
            string EncryptedPassword = encrypt.MD5Encrypt(ConfirmPassword_TextBox.Text);
            User user                = new User();
            user.Title               = Title_DropDownList.SelectedValue;
            user.FirstName           = FirstName_TextBox.Text;
            user.LastName            = LastName_TextBox.Text;
            user.EmailAddress        = Email_TextBox.Text;
            user.Passwordhash        = EncryptedPassword;
            user.Role                = Role_DropDownList.SelectedValue;
            user.CreatedDate         = DateTime.Today.ToString("dd/MM/yyyy");

            user.New_User(ConnectionString, user);

            Response.Redirect("Accounts.aspx");
         }
    }
}