using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Business_ContactNames;
using CRM_3TierArchitecture;

namespace ContactNames_Data
{
    public class clsDataContactNames
    {
        // string connstr = ConfigurationManager.ConnectionStrings["textconn"].ToString();


        public clsDataContactNames()
        {
        }
        //load all record from database
        public DataTable LoadContactNames()
        {
            string connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];

            SqlConnection conn = new SqlConnection(connstr);
            SqlDataAdapter adp = new SqlDataAdapter("selectcontactlist", conn);
            adp.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataSet ds = new DataSet();

            try
            {
                adp.Fill(ds, "tblstudent");
                return ds.Tables["tblstudent"];
            }
            catch
            {
                throw;
            }
            finally
            {
                ds.Dispose();
                adp.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
        public int Insert(string contactid, string firstname, string lastname, string email, string phNumber, Decimal autumn, Decimal winter, Decimal spring, string status)
        {

            string connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];


            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand cmd;

            conn.ConnectionString = connstr;
            conn.Open();
            cmd = new SqlCommand();
            cmd.CommandText = "insertcontactlist";
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@contact_id", contactid);
                cmd.Parameters.AddWithValue("@first_name", firstname);
                cmd.Parameters.AddWithValue("@last_name", lastname);
                cmd.Parameters.AddWithValue("@email_address", email);
                cmd.Parameters.AddWithValue("@phone_number", phNumber);
                cmd.Parameters.AddWithValue("@autumn", autumn);
                cmd.Parameters.AddWithValue("@winter", winter);
                cmd.Parameters.AddWithValue("@spring", spring);
              //  cmd.Parameters.AddWithValue("@total_stipend", total_stipend);     
                cmd.Parameters.AddWithValue("@status_name", status);
                cmd.Connection = conn;
                return cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
        public int Update(string contactid, string firstname, string lastname, string email, string phNumber, Decimal autumn, Decimal winter,  Decimal spring, string status)
        {
            //Update record into database
            string connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand cmd;
            conn.ConnectionString = connstr;
            conn.Open();
            cmd = new SqlCommand();
            cmd.CommandText = "updatecontact";
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@contact_id", contactid);
                cmd.Parameters.AddWithValue("@first_name", firstname);
                cmd.Parameters.AddWithValue("@last_name", lastname);
                cmd.Parameters.AddWithValue("@email_address", email);
                cmd.Parameters.AddWithValue("@phone_number", phNumber);
                cmd.Parameters.AddWithValue("@autumn", autumn);
                cmd.Parameters.AddWithValue("@winter", winter);
                cmd.Parameters.AddWithValue("@spring", spring);
              //  cmd.Parameters.AddWithValue("@total_stipend", total_stipend);    
                cmd.Parameters.AddWithValue("@status_name", status);
                cmd.Connection = conn;
                return cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }
        public int Delete(string contactid)
        {

            string connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];

            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand cmd;

            conn.ConnectionString = connstr;
            conn.Open();
            cmd = new SqlCommand();
            cmd.CommandText = "deletecontactnames";
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@contact_id", contactid);
                cmd.Connection = conn;
                return cmd.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                cmd.Dispose();
                conn.Close();
                conn.Dispose();
            }
        }

    }
}











