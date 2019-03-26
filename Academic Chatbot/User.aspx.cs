using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class User : System.Web.UI.Page
    {
        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            no_of_users.Text = User_GridView.Rows.Count.ToString();
            NoOfAdmin_Label.Text = Convert.ToString(CountAdmin());
            NoOfFYPCoordinator_Label.Text = Convert.ToString(CountFYPCoordinator());
            NoOfLICoordinator_Label.Text = Convert.ToString(CountLICoordinator());
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

        public int CountAdmin()
        {
            string SelectSQL = "SELECT COUNT(*) FROM [user] WHERE role_ID = 1";
            int count = 0;

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand SQLCmd = new SqlCommand(SelectSQL, conn))
                {
                    conn.Open();
                    count = (int)SQLCmd.ExecuteScalar();
                }
            }
            return count;
        }

        public int CountFYPCoordinator()
        {
            string SelectSQL = "SELECT COUNT(*) FROM [user] WHERE role_ID = 2";
            int count = 0;

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand SQLCmd = new SqlCommand(SelectSQL, conn))
                {
                    conn.Open();
                    count = (int)SQLCmd.ExecuteScalar();
                }
            }
            return count;
        }

        public int CountLICoordinator()
        {
            string SelectSQL = "SELECT COUNT(*) FROM [user] WHERE role_ID = 3";
            int count = 0;

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand SQLCmd = new SqlCommand(SelectSQL, conn))
                {
                    conn.Open();
                    count = (int)SQLCmd.ExecuteScalar();
                }
            }
            return count;
        }
    }
}