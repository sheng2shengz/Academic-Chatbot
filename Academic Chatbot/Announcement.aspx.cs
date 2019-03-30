using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using System.Data.SqlClient;
using System.Data;

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
            announcement.Status = "saved";

            announcement.NewAnnouncement(ConnectionString, announcement);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();

            announcement_GridView.DataBind();
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

            if (e.CommandName.ToString() == "SendCommand")
            {

            }
        }

        protected void SendAnnouncement_Button_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM [studentView] WHERE cohort = '" + Cohort_DropDownList.SelectedItem.Text + "'";
            cmd.Connection = con;
            DataTable membersTable = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            con.Open();
            da.Fill(membersTable);
            con.Close();


            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("acabotfki@gmail.com");
            foreach (DataRow row in membersTable.Rows)
                msg.To.Add(row["email_address"].ToString());
            msg.Subject = subject_TextBox.Text;
            msg.Body = body_TextBox.Text;
            msg.IsBodyHtml = true;
            msg.Priority = MailPriority.High;
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network; smtpClient.Credentials = new NetworkCredential("acabotfki@gmail.com", "Q1w2e3r4Acabot");
            smtpClient.EnableSsl = true;  // use SSL
            if (msg.To.Count > 0)
                smtpClient.Send(msg);

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
            announcement.Status = "sent";

            announcement.NewAnnouncement(ConnectionString, announcement);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "sentModal", "$('#sentModal').modal();", true);
            upModal.Update();

            SentAnnouncement_GridView.DataBind();
        }
    }
}