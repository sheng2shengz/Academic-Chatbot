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
    public partial class Dashboard : System.Web.UI.Page
    {
        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            NoOfAnnouncement_Label.Text = Convert.ToString(CountAnnouncement());
            NoOfStudent_Label.Text = Convert.ToString(CountStudent());
            NoOfCohort_Label.Text = Convert.ToString(CountCohort());
            NoOfAdmin_Label.Text = Convert.ToString(CountAdmin());
            NoOfFYPCoordinator_Label.Text = Convert.ToString(CountFYPCoordinator());
            NoOfLICoordinator_Label.Text = Convert.ToString(CountLICoordinator());
        }
      
        public int CountStudent()
        {
            string SelectSQL = "SELECT COUNT(*) FROM student";
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

        public int CountCohort()
        {
            string SelectSQL = "SELECT COUNT(*) FROM cohort";
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

        public int CountAnnouncement()
        {
            string SelectSQL = "SELECT COUNT(*) FROM announcement WHERE status = 'saved'";
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