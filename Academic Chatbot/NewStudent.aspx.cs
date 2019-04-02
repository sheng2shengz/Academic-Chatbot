using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class NewStudent : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userType"] == null)
                Response.Redirect("Login.aspx");
        }

        protected void back_ImageButton_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("Student.aspx");
        }

        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Submit_Button_Click(object sender, EventArgs e)
        {
            StudentFunc student = new StudentFunc();
            student.StudentId = StudentID_TextBox.Text;
            student.Name = Name_TextBox.Text;
            student.EmailAddress = EmailAddress_TextBox.Text;
            student.Course = Course_Dropdownlist.SelectedValue;
            student.Cohort = Cohort_Dropdownlist.SelectedValue;

            student.NewStudent(ConnectionString, student);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();

        }
    }
}