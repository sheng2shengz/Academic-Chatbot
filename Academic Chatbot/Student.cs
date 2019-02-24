using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;

namespace Academic_Chatbot
{
    public class StudentFunc
    {
        public string OldStudentId { get; set; }
        public string StudentId { get; set; }
        public string Name { get; set; }
        public string EmailAddress { get; set; }
        public string Course { get; set; }
        public string Cohort { get; set; }

        public void NewStudent(string connectionString, StudentFunc student)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("NewStudent", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@StudentId", student.StudentId));
                    cmd.Parameters.Add(new SqlParameter("@EmailAddress", student.EmailAddress));
                    cmd.Parameters.Add(new SqlParameter("@Name", student.Name));
                    cmd.Parameters.Add(new SqlParameter("@Course", student.Course));
                    cmd.Parameters.Add(new SqlParameter("@Cohort", student.Cohort));

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

        public void UpdateStudent(string connectionString, StudentFunc student)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("UpdateStudent", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@OldStudentId", student.OldStudentId));
                    cmd.Parameters.Add(new SqlParameter("@NewStudentId", student.StudentId));
                    cmd.Parameters.Add(new SqlParameter("@EmailAddress", student.EmailAddress));
                    cmd.Parameters.Add(new SqlParameter("@Name", student.Name));
                    cmd.Parameters.Add(new SqlParameter("@Course", student.Course));
                    cmd.Parameters.Add(new SqlParameter("@Cohort", student.Cohort));

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

        public void DeleteStudent(string connectionString, StudentFunc student)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    SqlCommand cmd = new SqlCommand("DeleteStudent", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("@StudentId", student.StudentId));

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

        public StudentFunc GetStudentData(string connectionString, string StudentId)
        {
            SqlConnection con = new SqlConnection(connectionString);

            string SelectSQL = "SELECT student_id, cohort, email_address, name, course FROM studentView WHERE student_id = '" + StudentId + "'";
            con.Open();

            SqlCommand cmd = new SqlCommand(SelectSQL, con);

            SqlDataReader dr = cmd.ExecuteReader();

            StudentFunc student = new StudentFunc();

            if (dr != null)
            {
                while (dr.Read())
                {
                    student.StudentId = dr["student_id"].ToString();
                    student.Name = dr["name"].ToString();
                    student.EmailAddress = dr["email_address"].ToString();
                    student.Course = dr["course"].ToString();
                    student.Cohort = dr["cohort"].ToString();
                }
            }
            return student;
        }
    }
}