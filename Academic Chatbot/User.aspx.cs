using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            no_of_users.Text = User_GridView.Rows.Count.ToString();
        }

        protected void Edit_LinkButton_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("UpdateUser.aspx");
        }

        protected void CreateUser_Button_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("NewUser.aspx");
        }

        protected void UserGridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "EditCommand")
                Response.Redirect("UpdateUser.aspx?user_id=" + e.CommandArgument);

            if (e.CommandName.ToString() == "DeleteCommand") //If delete is clicked, run deletecollaboration stored procedure
            {
                string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;
                int user_id = Convert.ToInt32(e.CommandArgument.ToString());
                UserFunc User = new UserFunc();
                User.DeleteUser(ConnectionString, user_id);
                User_GridView.DataBind();
            }
        }
    }
}