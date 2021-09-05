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
    public partial class Login : System.Web.UI.Page
    {
       
        protected System.Web.UI.WebControls.Label labelerrorpassword;
        protected System.Web.UI.WebControls.Label labelerrorusername;
        protected System.Web.UI.WebControls.Label lblerror;
        protected System.Web.UI.WebControls.Button LoginIn;
       // protected System.Web.UI.WebControls.Label Label9;
        protected System.Web.UI.WebControls.TextBox txtpass;
       // protected System.Web.UI.WebControls.Label Label8;
        protected System.Web.UI.WebControls.TextBox txtusname;
        protected System.Web.UI.WebControls.TextBox txtPassword;
       // protected System.Web.UI.WebControls.Label Label6;
        protected System.Web.UI.WebControls.TextBox txtUserName;
       // protected System.Web.UI.WebControls.Label Label5;
        protected System.Web.UI.WebControls.TextBox txtEmail;
      //  protected System.Web.UI.WebControls.Label Label4;
        protected System.Web.UI.WebControls.TextBox txtLastName;
     //   protected System.Web.UI.WebControls.Label Label3;
        protected System.Web.UI.WebControls.TextBox txtFirstName;
     //   protected System.Web.UI.WebControls.Label Label1;
      //  protected System.Web.UI.WebControls.Label Label10;
        protected System.Web.UI.WebControls.Button save;
        protected System.Web.UI.WebControls.Button cancel;
        protected System.Web.UI.WebControls.HyperLink HyperLink1;
    //    protected System.Web.UI.WebControls.Label Label7;
    


        private void Page_Load(object sender, System.EventArgs e)
        {
            // Put user code to initialize the page here
            if (CheckBox.Checked)
            {
                string user;
                txtusname.Text = "123";
                txtpass.Text = "123";
                user = txtusname.Text;
                user = txtpass.Text;
                getuser(user);
            }
            
        }

        #region Web Form Designer generated code
        override protected void OnInit(EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
            base.OnInit(e);
        }

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {

            this.LoginIn.Click += new System.EventHandler(this.LoginIn_Click);
            this.Load += new System.EventHandler(this.Page_Load);

        }
        #endregion
 
   
        private void LoginIn_Click(object sender, System.EventArgs e)
        {

            // ****creating a datatable and giving it the name
            DataTable dt;
            dt = new DataTable("tbluser");
            DataColumn dc1;
            DataColumn dc2;

            //***Creating two datacolumns
            //***creating the first column 

            dc1 = new DataColumn();
            dc1.ColumnName = "username";
            dc1.DataType = System.Type.GetType("System.String");
            dc2 = new DataColumn();
            dc2.ColumnName = "password";
            dc2.DataType = System.Type.GetType("System.String");

            //adding these two columns to the datatable's Column collection

            dt.Columns.Add(dc1);
            dt.Columns.Add(dc2);

            SqlConnection conn;
            string connstr;
            conn = new SqlConnection();
            string userid;
            userid = Request.QueryString["userid"];
            try
            {
                connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];
                //CREATING A CONNECTION STRING
                conn.ConnectionString = connstr;
                conn.Open();
                //CREATING A COMMAND OBJECT
                SqlCommand cmd;
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "loguserinfo";
                cmd.Connection = conn;
                cmd.Parameters.Add("@user_id", SqlDbType.Int, 4);
                cmd.Parameters["@user_id"].Value = 123;
                //CREATE A DATATABLE TO HOLD THE DATA
                dt = new DataTable("tbluser");
                //CREATING A DATAADAPTER
                SqlDataAdapter da;
                da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dt);
                //loop in the table and compare the data in each cell
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["username"].ToString() != txtusname.Text.ToString().Trim() && dr["password"].ToString() != txtpass.Text.ToString().Trim())
                    {
                        labelerrorusername.Text = "*";
                        labelerrorpassword.Text = "*";
                        //break;
                    }
                    if (dr["username"].ToString() == txtusname.Text.ToString().Trim() && dr["password"].ToString() == txtpass.Text.ToString().Trim())
                    {
                        Server.Transfer("Note.aspx");
                        //  break;
                    }
                    if (dr["username"].ToString() != txtusname.Text.ToString().Trim() && dr["password"].ToString() == txtpass.Text.ToString().Trim())
                    {
                        labelerrorusername.Text = "*";
                        labelerrorpassword.Text = "";
                        // break;
                    }
                    if (dr["username"].ToString() == txtusname.Text.ToString().Trim() && dr["password"].ToString() != txtpass.Text.ToString().Trim())
                    {
                        labelerrorpassword.Text = "*";
                        labelerrorusername.Text = "";
                        // break;
                    }
                }
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                takecareoferrors(ex.ToString());
            }
            finally
			{	
				if (conn != null && conn.State == ConnectionState.Open )
				{
					conn.Close() ;
					conn = null;
				}
			}				
		}
        private void takecareoferrors(string errorstring)
        {
            lblerror.Text = errorstring;
        }
        //Get User Info
        private void getuser(string userid)
        {
            SqlConnection conn;
            //intializing the conn object
            conn = new SqlConnection();
            try
            {
                userid = Request.QueryString["userid"];
                //specifying the connection string
                string connstr;
                connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];
                //CREATING A CONNECTION STRING
                //Declare a variable conn of type Sqlconnection object which is the connection
                //specifying the connection string to it
                conn.ConnectionString = connstr;
                //now that i am done preparing the connection object, i will open it up to access the database
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
                // TAKIGN THE DATA AND PUTTING IT INTO THE TEXTBOX CONTROL

                txtusname.Text = dt.Rows[0]["username"].ToString().Trim();
                txtpass.Text = dt.Rows[0]["password"].ToString().Trim();
                cmd.ExecuteNonQuery();
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



        
      
    }
}

          
        
       
        

            
               
               
           
              
            
           
           
     
        
      

    
