using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class Accounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Edit_LinkButton_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("UpdateUser.aspx");
        }

        protected void CreateUser_Button_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("NewUser.aspx");
        }
    }
}