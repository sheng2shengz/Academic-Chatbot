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
    public partial class AdminMaster : MasterPage
    {
        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Greeting_Label.Text = GreetingTime();
            Title_Label.Text = GetTitle();
            FirstName_Label.Text = GetFirstName();
            LastName_Label.Text = GetLastName();
        }

        protected string GreetingTime()
        {
            TimeSpan Morning4 = new TimeSpan(04, 0, 0);
            TimeSpan Morning11 = new TimeSpan(11, 59, 59);
            TimeSpan Afternoon4 = new TimeSpan(16, 59, 59);
            TimeSpan now = DateTime.Now.TimeOfDay;

            if ((now >= Morning4) && (now <= Morning11))
            {
                return "Good Morning";
            }
            else if ((now > Morning11) && (now <= Afternoon4))
            {
                return "Good Afternoon";
            }
            else
                return "Good Evening";
        }

        public string GetTitle()
        {
            string SelectSQL = "SELECT title FROM [user] WHERE user_id = '" + Session["UserId"].ToString() + "'";
            string title;
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand SQLCmd = new SqlCommand(SelectSQL, conn))
                {
                    conn.Open();
                    title = (string)SQLCmd.ExecuteScalar();
                }
            }
            return title;
        }

        public string GetFirstName()
        {
            string SelectSQL = "SELECT first_name FROM [user] WHERE user_id = '" + Session["UserId"].ToString() + "'";
            string FirstName;
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand SQLCmd = new SqlCommand(SelectSQL, conn))
                {
                    conn.Open();
                    FirstName = (string)SQLCmd.ExecuteScalar();
                }
            }
            return FirstName;
        }

        public string GetLastName()
        {
            string SelectSQL = "SELECT last_name FROM [user] WHERE user_id = '" + Session["UserId"].ToString() + "'";
            string LastName;
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand SQLCmd = new SqlCommand(SelectSQL, conn))
                {
                    conn.Open();
                    LastName = (string)SQLCmd.ExecuteScalar();
                }
            }
            return LastName;
        }

        protected void signout_onclick(object sender, EventArgs e)
        {
            Session.Abandon();
        }
    }
}