using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Academic_Chatbot
{
    public class AnnouncementFunc
    {
        public int AnnouncementId { get; set; }
        public string Type { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public int CohortID { get; set; }
        public string Status { get; set; }
        public string Cohort { get; set; }

        public void NewAnnouncement(string connectionString, AnnouncementFunc announcement)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("NewAnnouncement", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@Type", announcement.Type));
                    cmd.Parameters.Add(new SqlParameter("@Subject", announcement.Subject));
                    cmd.Parameters.Add(new SqlParameter("@Body", announcement.Body));
                    cmd.Parameters.Add(new SqlParameter("@CohortID", announcement.CohortID));
                    cmd.Parameters.Add(new SqlParameter("@Status", announcement.Status));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateAnnouncement(string connectionString, AnnouncementFunc announcement)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UpdateAnnouncement", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@AnnouncementId", announcement.AnnouncementId));
                    cmd.Parameters.Add(new SqlParameter("@Subject", announcement.Subject));
                    cmd.Parameters.Add(new SqlParameter("@Body", announcement.Body));
                    cmd.Parameters.Add(new SqlParameter("@CohortID", announcement.CohortID));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateAnnouncementStatus(string connectionString, AnnouncementFunc announcement)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UpdateAnnouncementStatus", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@AnnouncementId", announcement.AnnouncementId));
                    cmd.Parameters.Add(new SqlParameter("@Status", announcement.Status));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void DeleteAnnouncement(string connectionString, int AnnouncementId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("DeleteAnnouncement", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@AnnouncementId", AnnouncementId));

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public AnnouncementFunc GetAnnouncementData(string connectionString, int AnnouncementId)
        {
            SqlConnection con = new SqlConnection(connectionString);

            string SelectSQL = "SELECT [announcement_id], [subject], [body], [cohort_ID] FROM announcement WHERE announcement_id = '" + AnnouncementId + "'";
            con.Open();

            SqlCommand cmd = new SqlCommand(SelectSQL, con);
            SqlDataReader dr = cmd.ExecuteReader();
            AnnouncementFunc Announcement = new AnnouncementFunc();
            if (dr != null)
            {
                while (dr.Read())
                {
                    Announcement.AnnouncementId = Convert.ToInt32(dr["announcement_id"]);
                    Announcement.Subject = dr["subject"].ToString();
                    Announcement.Body = dr["body"].ToString();
                    Announcement.CohortID = Convert.ToInt32(dr["cohort_ID"].ToString());
                }
            }
            return Announcement;
        }
    }
}