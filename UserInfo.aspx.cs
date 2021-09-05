using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Business_UserInfo;


namespace CRM_3TierArchitecture
{
    public partial class UserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                // Put user code to initialize the page here
                if (Page.IsPostBack == false)
                {
                    string user;
                    txtFirstName.Text = "123";
                    user = txtFirstName.Text;
                    getUserInfo(user);
                }    
             }  
        }
        public void getUserInfo(string userid)
        {
           
            SqlConnection conn;
            //intializing the conn object
            conn = new SqlConnection();
            try
            {

                //specifying the connection string
                string connstr;
                connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];
                //CREATING A CONNECTION STRING
                //Declare a variable conn of type Sqlconnection object which is the connection
                //specifying the connection string to it
                conn.ConnectionString = connstr;
                // open connection conn to access the database
                conn.Open();
                //CREATING A COMMAND OBJECT
                SqlCommand cmd;
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "selectuserinfo";
                cmd.Parameters.Add("@user_id", SqlDbType.Int, 4);
                cmd.Parameters["@user_id"].Value = 123;
                cmd.Connection = conn;
                //CREATE A DATATABLE TO HOLD THE DATA
                DataTable dt;
                dt = new DataTable("tbluser");
                //CREATING A DATAADAPTER
                SqlDataAdapter da;
                da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
                //TAKIGN THE DATA AND PUTTING IT INTO THE TEXTBOX CONTROL
                txtFirstName.Text = dt.Rows[0]["firstname"].ToString().Trim();
                txtLastName.Text = dt.Rows[0]["lastname"].ToString().Trim();
                txtEmail.Text = dt.Rows[0]["email"].ToString().Trim();
                txtUserName.Text = dt.Rows[0]["username"].ToString().Trim();
                txtPassword.Text = dt.Rows[0]["password"].ToString().Trim();
                cmd.ExecuteNonQuery();

            }
            catch
            {
                throw;
            }
            finally
            {
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                    conn = null;
                }
            }
        }
        protected void UpdateUser(object sender,EventArgs e)
        {
         
            int intResult = 0;

            
            string firstname=txtFirstName.Text;
            string lastname=txtLastName.Text;
            string username=txtUserName.Text;
            string password=txtPassword.Text;
            string email=txtEmail.Text;

            //Intantiate cbI
            UserInfoBl cbI = new UserInfoBl();
            try
            {
                intResult = cbI.UpdateUser(txtFirstName.Text, txtLastName.Text, txtUserName.Text,txtPassword.Text, txtEmail.Text);


                if (intResult > 0)
                {
                    lblMessage1.Text = "User Informations Updated Successfully.";
                }
                else
                {
                    lblMessage1.Text = "User Informations couldn't updated.";
                }
            }
            catch (Exception ex)
            {
                takecareoferrors(ex.ToString());
            }
            finally
            {
                cbI = null;
            }
        }
        protected void cancel_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
            lblMessage1.Text = "";
        }
        private void takecareoferrors(string errorstring)
        {
            lblerror.Text = errorstring;
        }
       

    }
}
