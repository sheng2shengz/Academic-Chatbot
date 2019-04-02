using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Academic_Chatbot
{
    public class BasePage : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e)
        {
            try
            {
                if (Session["userType"].ToString() == "1")
                    this.Page.MasterPageFile = "/Admin.Master";
                else if (Session["userType"].ToString() == "2")
                    this.Page.MasterPageFile = "/FYP.Master";
                else if (Session["userType"].ToString() == "3")
                    this.Page.MasterPageFile = "/LI.Master";
            }
            catch (Exception ex)
            {

            }
        }

    }
}