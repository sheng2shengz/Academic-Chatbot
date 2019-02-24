using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class UpdateStudent : System.Web.UI.Page
    {
        string OldStudentId, NewStudentId;
        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["student_id"] != "")
            {
                OldStudentId = Request.QueryString["student_id"].ToString();
                NewStudentId = OldStudentId;
            }
            else
                Response.Redirect("Student.aspx");

            if (!IsPostBack)
            {
                FillStudentData();
            }
        }

        protected void back_ImageButton_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Student.aspx");
        }
         
        private void FillStudentData()
        {
            StudentFunc student = new StudentFunc();

            student = student.GetStudentData(ConnectionString, NewStudentId);

            StudentID_TextBox.Text = student.StudentId;
            Name_TextBox.Text = student.Name;
            EmailAddress_TextBox.Text = student.EmailAddress;
            Course_Dropdownlist.SelectedValue = student.Course;
            Cohort_Dropdownlist.SelectedValue = student.Cohort;
        }

        protected void Submit_Button_Click(object sender, EventArgs e)
        {
            StudentFunc student = new StudentFunc();
            student.OldStudentId = OldStudentId;
            student.StudentId = StudentID_TextBox.Text;
            student.Name = Name_TextBox.Text;
            student.EmailAddress = EmailAddress_TextBox.Text;
            student.Course = Course_Dropdownlist.SelectedValue;
            student.Cohort = Cohort_Dropdownlist.SelectedValue;

            student.UpdateStudent(ConnectionString, student);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();

            Response.AddHeader("REFRESH", "1;URL=Student.aspx");
        }
    }
}