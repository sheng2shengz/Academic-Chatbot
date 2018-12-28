using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;

namespace Academic_Chatbot
{
    public class User
    {
        public string EmailAddress { get; set; }
        public string Passwordhash { get; set; }
        public string Title { get; set; }
        public string Role { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CreatedDate { get; set; }

        public void New_User(string connectionString, User user)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("New_User", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@EmailAddress", user.EmailAddress));
                    cmd.Parameters.Add(new SqlParameter("@Passwordhash", user.Passwordhash));
                    cmd.Parameters.Add(new SqlParameter("@Role", user.Role));
                    cmd.Parameters.Add(new SqlParameter("@Title", user.Title));
                    cmd.Parameters.Add(new SqlParameter("@FirstName", user.FirstName));
                    cmd.Parameters.Add(new SqlParameter("@LastName", user.LastName));
                    cmd.Parameters.Add(new SqlParameter("@CreatedDate", user.CreatedDate));

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
    }
}