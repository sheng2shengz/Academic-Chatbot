using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}