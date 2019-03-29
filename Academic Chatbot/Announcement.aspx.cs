using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Academic_Chatbot
{
    public partial class Announcement : System.Web.UI.Page
    {
        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Master.ToString() == "ASP.admin_master")
            {
                type_Label.Visible = true;
                type_Dropdownlist.Visible = true;
                Announcement_SqlDataSource.SelectCommand = "SELECT * FROM [announcementView]";
            }
            else if (Master.ToString() == "ASP.fyp_master")
            {
                Announcement_SqlDataSource.SelectCommand = "SELECT * FROM [announcementView] WHERE name = 'FYP'";
                type_Label.Visible = false;
                type_Dropdownlist.Visible = false;
            }
            else if (Master.ToString() == "ASP.li_master")
            {
                 Announcement_SqlDataSource.SelectCommand = "SELECT * FROM [announcementView] WHERE name = 'LI'";
                type_Label.Visible = false;
                type_Dropdownlist.Visible = false;
            }
        }

        protected void SaveAnnouncement_Button_Click(object sender, EventArgs e)
        {
            AnnouncementFunc announcement = new AnnouncementFunc();
            announcement.Subject = subject_TextBox.Text;
            announcement.Body = body_TextBox.Text;
            announcement.CohortID = Int32.Parse(Cohort_DropDownList.SelectedValue.ToString());
            if (Master.ToString() == "ASP.FYP_master")
                announcement.Type = "FYP";
            else if (Master.ToString() == "ASP.LI_master")
                announcement.Type = "LI";
            else if (Master.ToString() == "ASP.admin_master")
                announcement.Type = type_Dropdownlist.SelectedValue;

            announcement.NewAnnouncement(ConnectionString, announcement);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();

            Response.AddHeader("REFRESH", "3;URL=Announcement.aspx");
        }

        protected void announcement_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "EditCommand")
                Response.Redirect("UpdateStudent.aspx?student_id=" + e.CommandArgument);

            if (e.CommandName.ToString() == "DeleteCommand")
            {
                int announcement_id = Convert.ToInt32(e.CommandArgument.ToString());
                AnnouncementFunc Announcement = new AnnouncementFunc();
                Announcement.DeleteAnnouncement(ConnectionString, announcement_id);
                announcement_GridView.DataBind();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void SendAnnouncement_Button_Click(object sender, EventArgs e)
        {

        }
    }
}