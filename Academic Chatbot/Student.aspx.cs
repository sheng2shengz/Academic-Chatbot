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
    public partial class Student : System.Web.UI.Page
    {
        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            NoOfStudent_Label.Text = Convert.ToString(CountStudent());
            NoOfCohort_Label.Text = Convert.ToString(CountCohort());
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

        protected void AddCohort_Button_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }

        protected void DeleteCohort_Button_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal2", "$('#myModal2').modal();", true);
            upModal.Update();
        }

        protected void AddStudent_Button_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewStudent.aspx");
        }

        protected void Student_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "EditCommand")
                Response.Redirect("UpdateStudent.aspx?student_id=" + e.CommandArgument);

            //if (e.commandname.tostring() == "deletecommand")
            //{
            //    string connectionstring = webconfigurationmanager.connectionstrings["academic_chatbotconnectionstring"].connectionstring;
            //    char student_id = convert.tochar(e.commandargument.tostring());
            //    studentfunc student = new studentfunc();
            //    student.deletestudent(connectionstring, student_id);
            //    student_gridview.databind();
            //}
        }

        protected void AddCohortModal_Button_Click(object sender, EventArgs e)
        {
            CohortFunc cohort = new CohortFunc();
            cohort.Name = AddCohortModal_TextBox.Text;
            cohort.NewCohort(ConnectionString, cohort);
            Response.Redirect("Student.aspx");
        }

        protected void DeleteCohortModal_Button_Click(object sender, EventArgs e)
        {
            CohortFunc cohort = new CohortFunc();
            cohort.Name = CohortModal_Dropdownlist.SelectedValue;
            cohort.DeleteCohort(ConnectionString, cohort);
            Response.Redirect("Student.aspx");
        }
    }
}