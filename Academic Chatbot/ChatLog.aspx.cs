using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class ChatLog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void back_ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Knowledgebase.aspx");
        }
    }
}