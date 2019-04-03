using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class Knowledgebase : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Edit_LinkButton_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }

        protected void ChatLog_Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChatLog.aspx");
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("QnANewEntry.aspx");
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            Response.Redirect("QnADeleteEntry.aspx");
        }
    }
}