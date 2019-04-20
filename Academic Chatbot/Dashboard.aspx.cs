using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class Dashboard : BasePage
    {
        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
                Response.Redirect("Login.aspx");

            if (!Page.IsPostBack)
            {
                if (Session["userType"].ToString() == "1") //admin
                {
                    NoOfAnnouncement_Label.Text = Convert.ToString(CountAnnouncement());
                    NoOfStudent_Label.Text = Convert.ToString(CountStudent());
                    NoOfCohort_Label.Text = Convert.ToString(CountCohort());
                    NoOfAdmin_Label.Text = Convert.ToString(CountAdmin());
                    NoOfFYPCoordinator_Label.Text = Convert.ToString(CountFYPCoordinator());
                    NoOfLICoordinator_Label.Text = Convert.ToString(CountLICoordinator());
                }
                else if (Session["userType"].ToString() == "2") //fyp
                {
                    NoOfAnnouncement_Label.Text = Convert.ToString(CountFYPAnnouncement());
                    NoOfStudent_Label.Text = Convert.ToString(CountStudent());
                    NoOfCohort_Label.Text = Convert.ToString(CountCohort());
                    NoOfUser_Label.Visible = false;
                }
                else if (Session["userType"].ToString() == "3") //li
                {
                    NoOfAnnouncement_Label.Text = Convert.ToString(CountLIAnnouncement());
                    NoOfStudent_Label.Text = Convert.ToString(CountStudent());
                    NoOfCohort_Label.Text = Convert.ToString(CountCohort());
                    NoOfUser_Label.Visible = false;
                }
            }
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

        public int CountFYPAnnouncement()
        {
            string SelectSQL = "SELECT COUNT(*) FROM announcement WHERE status = 'saved' AND type_ID = '1'";
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

        public int CountLIAnnouncement()
        {
            string SelectSQL = "SELECT COUNT(*) FROM announcement WHERE status = 'saved' AND type_ID = '2'";
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

        public int CountFYPSavedAnnouncement()
        {
            string SelectSQL = "SELECT COUNT(*) FROM announcement WHERE status = 'saved' AND type_ID = '1'";
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

        public int CountFYPSentAnnouncement()
        {
            string SelectSQL = "SELECT COUNT(*) FROM announcement WHERE status = 'saved'AND type_ID = '1'";
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

        protected void ctl43_Load(object sender, EventArgs e)
        {

        }
    }
}