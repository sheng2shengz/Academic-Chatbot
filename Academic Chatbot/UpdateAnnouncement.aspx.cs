using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Academic_Chatbot
{
    public partial class UpdateAnnouncement : System.Web.UI.Page
    {
        public string ConnectionString = WebConfigurationManager.ConnectionStrings["academic_chatbotConnectionString"].ConnectionString;
        int announcementId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["announcement_id"] != "")
                announcementId = Convert.ToInt16(Request.QueryString["announcement_id"]);
            else
                Response.Redirect("Announcement.aspx");

            if (!IsPostBack)
                FillAnnouncementData();

        }

        private void FillAnnouncementData()
        {
            UserFunc user = new UserFunc();
            AnnouncementFunc Announcement = new AnnouncementFunc();
            Announcement = Announcement.GetAnnouncementData(ConnectionString, announcementId);

            subject_TextBox.Text = Announcement.Subject;
            body_TextBox.Text = Announcement.Body;
            Cohort_DropDownList.SelectedValue = Announcement.CohortID.ToString();
        }

        protected void Submit_Button_Click(object sender, EventArgs e)
        {
            AnnouncementFunc Announcement = new AnnouncementFunc();
            Announcement.AnnouncementId = announcementId;
            Announcement.Subject = subject_TextBox.Text;
            Announcement.Body = body_TextBox.Text;
            Announcement.CohortID = Convert.ToInt32(Cohort_DropDownList.SelectedValue);
            Announcement.UpdateAnnouncement(ConnectionString, Announcement);

            Response.Redirect("Announcement.aspx");
        }

        protected void back_ImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Announcement.aspx");
        }
    }
}