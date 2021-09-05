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

namespace CRM_3TierArchitecture
{
    public partial class GetUserInfo : System.Web.UI.Page
    {

       
       
      
        protected System.Web.UI.WebControls.Label Label3;
        protected System.Web.UI.WebControls.HyperLink Hyperlink7;
        protected System.Web.UI.WebControls.HyperLink Hyperlink4;
        protected System.Web.UI.WebControls.HyperLink Hyperlink6;
        protected System.Web.UI.WebControls.HyperLink Hyperlink3;
        protected System.Web.UI.WebControls.HyperLink Hyperlink2;
        protected System.Web.UI.WebControls.Label Label2;
	

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void GetSpecificUserInfo(string email)
        {
            email = Convert.ToString(Request.QueryString["email"]);
            SqlConnection conn;
            //Sqlparameter object is used for passing parameters to a Command object
            SqlParameter param1;
            //intializing the conn object
            conn = new SqlConnection();
            try
            {
                //specifying the connection string
                string connstr;
                connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];
                //===================== CREATING A CONNECTION STRING ==============
                //Declare a variable conn of type Sqlconnection object which is the connection
                //specifying the connection string to it
                conn.ConnectionString = connstr;
                //now that i am done preparing the connection object, i will open it up to access the database
                conn.Open();
                //==========================CREATING A COMMAND OBJECT ===============
                SqlCommand cmd;
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "selectSpecificUserInfo";
                //creating a parameter object to pass in the status value
                param1 = new SqlParameter("@email", SqlDbType.VarChar, 50);
                email = Convert.ToString(txtmail.Text).Trim();
                param1.Value = email;
                //assigning that parameter object to the command object
                cmd.Parameters.Add(param1);
                //assigning the connection object to the connection property of the command
                cmd.Connection = conn;
                //======================== CREATE A DATATABLE TO HOLD THE DATA =======
                DataTable dt;
                dt = new DataTable("tbluser");
                //======================== CREATING A DATAADAPTER ====================
                SqlDataAdapter da;
                da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
                //====================== TAKIGN THE DATA AND PUTTING IT INTO THE DROPDOWN CONTROL ===
                DataGrid1.DataSource = dt;
                DataGrid1.DataBind();
            }
            catch (Exception ex)
            {
                takecareoferrors(ex.ToString());
            }
            // this block gets executed in the end after the  code in the try or catch is executed.
            finally
            {
                // check to see if this sqlconnection object is initlized or not, if it is initialized
                //then check to see if the sqlconnection object is open or not
                //if it is open then close it and then destroy the connectin object and release the memory
                if (conn != null && conn.State == ConnectionState.Open)
                {
                    conn.Close();
                    conn = null;
                }
            }
        }
        //Takes a paramter which is of type string and shows it in the lblerror label control
        private void takecareoferrors(string errorstring)
        {
            lblerror.Text = errorstring;
        }
        protected void sbutton_Click(object sender, EventArgs e)
        {
            //****creating a datatable and giving it the name
            DataTable dt;
            dt = new DataTable("tbluser");
            DataColumn dc1;
            //***Creating two datacolumns
            //***creating the first column 
            dc1 = new DataColumn();
            dc1.ColumnName = "email";
            dc1.DataType = System.Type.GetType("System.String");
            //****adding these two columns to the datatable's Column collection
            dt.Columns.Add(dc1);
            //***********creating connection*****************************************
            SqlConnection conn;
            string connstr;
            conn = new SqlConnection();
            string userid;
            userid = Request.QueryString["userid"];
            try
            {
                 connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];
                //===================== CREATING A CONNECTION STRING =============
                conn.ConnectionString = connstr;
                conn.Open();
                //==========================CREATING A COMMAND OBJECT ===============
                SqlCommand cmd;
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "emailinfo";
                cmd.Connection = conn;
                cmd.Parameters.Add("@user_id", SqlDbType.Int, 4);
                cmd.Parameters["@user_id"].Value = 123;
                //======================== CREATE A DATATABLE TO HOLD THE DATA =======
                dt = new DataTable("tbluser");
                //======================== CREATING A DATAADAPTER ====================
                SqlDataAdapter da;
                da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
                //**************************************************************************
                string select_user_info = Convert.ToString(txtmail.Text).Trim();
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["email"].ToString() == txtmail.Text.ToString().Trim())
                    {
                        lblcheckemail.Text = " ";
                        GetSpecificUserInfo(select_user_info);
                        break;
                    }
                    else
                    {
                        lblcheckemail.Text = "Sorry, we don't have information for this email!!!";
                        break;
                    }
                }


            }
            catch (Exception ex)
            {
                takecareoferrors(ex.ToString());
            }
        }

        protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}
