using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class NewUser : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

         protected void Submit_Button_OnClick(object sender, EventArgs e)
        {
            User user = new User();
            
            Response.Redirect("Accounts.aspx");
        }
    }
}