using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;

namespace Academic_Chatbot
{
    public class UserFunc
    {
        public int UserId { get; set; }
        public string EmailAddress { get; set; }
        public string Passwordhash { get; set; }
        public string Title { get; set; }
        public string Role { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string CreatedDate { get; set; }

        public void NewUser(string connectionString, UserFunc user)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("NewUser", conn);
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

        public void EditUserWithPassword(string connectionString, UserFunc user)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UpdateUserWithPassword", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@UserId", user.UserId));
                    cmd.Parameters.Add(new SqlParameter("@EmailAddress", user.EmailAddress));
                    cmd.Parameters.Add(new SqlParameter("@Passwordhash", user.Passwordhash));
                    cmd.Parameters.Add(new SqlParameter("@Role", user.Role));
                    cmd.Parameters.Add(new SqlParameter("@Title", user.Title));
                    cmd.Parameters.Add(new SqlParameter("@FirstName", user.FirstName));
                    cmd.Parameters.Add(new SqlParameter("@LastName", user.LastName));

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

        public void EditUserWithoutPassword(string connectionString, UserFunc user)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UpdateUserWithoutPassword", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@UserId", user.UserId));
                    cmd.Parameters.Add(new SqlParameter("@EmailAddress", user.EmailAddress));
                    cmd.Parameters.Add(new SqlParameter("@Role", user.Role));
                    cmd.Parameters.Add(new SqlParameter("@Title", user.Title));
                    cmd.Parameters.Add(new SqlParameter("@FirstName", user.FirstName));
                    cmd.Parameters.Add(new SqlParameter("@LastName", user.LastName));

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

        public UserFunc GetUserData(string connectionString, int userId)
        {
            SqlConnection con = new SqlConnection(connectionString);

            string SelectSQL = "SELECT user_id, email_address, role, title, first_name, last_name FROM userView WHERE user_id = " + userId;
            con.Open();

            SqlCommand cmd = new SqlCommand(SelectSQL, con);

            SqlDataReader dr = cmd.ExecuteReader();

            UserFunc user = new UserFunc();

            if (dr != null)
            {
                while (dr.Read())
                {
                    user.UserId = Convert.ToInt32(dr["user_id"]);
                    user.EmailAddress = dr["email_address"].ToString();
                    user.Title = dr["title"].ToString();
                    user.Role = dr["role"].ToString();
                    user.FirstName = dr["first_name"].ToString();
                    user.LastName = dr["last_name"].ToString();
                }
            }
            return user;
        }

        public void DeleteUser(string connectionString, int userId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("DeleteUser", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@UserId", userId));

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}