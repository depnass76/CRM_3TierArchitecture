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
using Business_UserInfo;
using System.Data.Linq;
namespace Data_UserInfo
{
    public class UserInfoDL
    {
        public int UpdateUser(string firstname, string lastname, string username, string password, string email)
        {
            //Update record into database
            string connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];
            int userid = 123;
            SqlConnection conn = new SqlConnection(connstr);
            SqlCommand cmd;
            conn.ConnectionString = connstr;
            conn.Open();
            cmd = new SqlCommand();
            cmd.CommandText = "updateuserinfo";
            try
            {
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@user_id", userid);
                cmd.Parameters.AddWithValue("@first_name", firstname);
                cmd.Parameters.AddWithValue("@last_name", lastname);
                cmd.Parameters.AddWithValue("@user_name", username);
                cmd.Parameters.AddWithValue("@enter_password", password);
                cmd.Parameters.AddWithValue("@email_address", email);
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
