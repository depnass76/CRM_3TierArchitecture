using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Linq;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using Business_ContactNames;
using ContactNames_Data;
using System.IO;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;

namespace CRM_3TierArchitecture
{
    

        public partial class ContactNames : System.Web.UI.Page
        {

           
            //protected System.Web.UI.WebControls.GridView GridView1;

            public void Page_Load(object sender, EventArgs e)
            {

                if (Page.IsPostBack == false)
                {
                     
                        string user;
                        lblfirstname.Text = "123";
                        user = lblfirstname.Text;
                        getUserInfo(user);

                      //-------------------------------//



                        


                        

                      //------------------------------//
                    
                        GridView1.ShowFooter = true;                                              
                        BindGrid();       
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
                   // connstr = System.Configuration.ConfigurationManager.AppSettings["conn"];
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
                    //TAKIGN THE DATA AND PUTTING IT INTO THE LABEL CONTROL
                    lblfirstname.Text = dt.Rows[0]["firstname"].ToString();
                    lbllastname.Text = dt.Rows[0]["lastname"].ToString();
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
          
            private DataTable BindGrid()
            {
                clsBusinessContactNames cbc = new clsBusinessContactNames();
                DataTable dTable = cbc.LoadContactNames();
                try
                {
                    if (dTable.Rows.Count > 0)
                    {

                       
                        GridView1.DataSource = dTable;
                        GridView1.DataBind();
                        

                    }
                    else
                    {
                        dTable.Rows.Add(dTable.NewRow());
                        GridView1.DataSource = dTable;
                        GridView1.DataBind();


                        int TotalColumns = GridView1.Rows[0].Cells.Count;
                        GridView1.Rows[0].Cells.Clear();
                        GridView1.Rows[0].Cells.Add(new TableCell());
                        GridView1.Rows[0].Cells[0].ColumnSpan = TotalColumns;
                        GridView1.Rows[0].Cells[0].Text = "No Record Found";
                    }

                   

                }
                catch (Exception ee)
                {
                    lblMessage1.Text = ee.Message.ToString();
                }
                finally
                {
                    cbc = null;
                }

                return dTable;



            }



           
         

            protected void EditRecordList(object sender, GridViewEditEventArgs e)
            {
                
                GridView1.EditIndex = e.NewEditIndex;
                BindGrid();

            }
            protected void CancelRecordList(object sender, GridViewCancelEditEventArgs e)
            {
                GridView1.EditIndex = -1;
                BindGrid();
                lblMessage1.Text = "Record canceled.";
            }
         
            protected void UpdateRecordList(object sender, GridViewUpdateEventArgs e)
            {
               // string total_stipend = GridView1.DataKeys[e.RowIndex].Value.ToString();
                int intResult = 0;

               
                TextBox txt_contactid = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_contactid");
                TextBox txt_first_name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_first_name");
                TextBox txt_last_name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_last_name");
                TextBox txt_email = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_email");              
                TextBox txt_phone_number = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_phone_number");
                TextBox txt_autumn = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_autumn");
                TextBox txt_winter = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_winter");
                Label total_stipend = (Label)GridView1.FooterRow.FindControl("total_stipend");
                TextBox txt_spring = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txt_spring");                
                DropDownList cmbType = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("cmbType");

               
                //Intantiate cbn
                clsBusinessContactNames cbc = new clsBusinessContactNames();
                try
                {

                    intResult = cbc.Update(txt_contactid.Text, txt_first_name.Text, txt_last_name.Text, txt_email.Text, txt_phone_number.Text, Convert.ToDecimal(txt_autumn.Text), Convert.ToDecimal(txt_winter.Text), Convert.ToDecimal(txt_spring.Text), cmbType.SelectedValue);
                   

                    if (intResult > 0)
                    {
                        lblMessage1.Text = "Record Updated Successfully.";
                        lblerror.Text = "";
                    }
                    else
                    {
                        lblMessage1.Text = "Record couldn't updated.";
                        lblerror.Text = "";
                    }
                }
                catch (Exception ee)
                {
                    lblMessage1.Text = ee.Message.ToString();
                }
                finally
                {
                    cbc = null;
                }

                GridView1.EditIndex = -1;
                //Refresh the list  
                BindGrid();
            
         
            }
            protected void grd_RowCommand_names(object sender, GridViewCommandEventArgs e)
            {
               
                GridView1.EditIndex = -1;
                
                if (e.CommandName.Equals("Insert"))
                {
                    
                    //object of the business layer
                    clsBusinessContactNames cbc = new clsBusinessContactNames();
           
                    int intResult = 0;
                    //DataSet Ds;
                  
                    TextBox txt_contactid = (TextBox)GridView1.FooterRow.FindControl("txt_contactid");   
                    TextBox txt_first_name = (TextBox)GridView1.FooterRow.FindControl("txt_first_name");
                    TextBox txt_last_name = (TextBox)GridView1.FooterRow.FindControl("txt_last_name");
                    TextBox txt_email = (TextBox)GridView1.FooterRow.FindControl("txt_email");                   
                    TextBox txt_phone_number = (TextBox)GridView1.FooterRow.FindControl("txt_phone_number");
                    TextBox txt_autumn = (TextBox)GridView1.FooterRow.FindControl("txt_autumn");
                    TextBox txt_winter = (TextBox)GridView1.FooterRow.FindControl("txt_winter");                  
                    TextBox txt_spring = (TextBox)GridView1.FooterRow.FindControl("txt_spring");
                    Label total_stipend = (Label)GridView1.FooterRow.FindControl("total_stipend");
                    DropDownList cmbType = (DropDownList)GridView1.FooterRow.FindControl("cmbType");

                 
                        
                 
                    try
                    {


                        intResult = cbc.Insert(txt_contactid.Text, txt_first_name.Text, txt_last_name.Text, txt_email.Text, txt_phone_number.Text, Convert.ToDecimal(txt_autumn.Text), Convert.ToDecimal(txt_winter.Text), Convert.ToDecimal(txt_spring.Text), cmbType.SelectedValue);
                        
                       
                            // Set the three values in the new table now. 
                        
                        if (intResult > 0)
                        {
                            lblMessage1.Text = "New record inserted successfully";
                            lblerror.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblerror.Text = ex.Message.ToString();
                    }
                    finally
                    {
                         cbc = null;
                    }

                    BindGrid();
            }
           }
            
                             

            protected void DeleteRecordList(object sender, GridViewDeleteEventArgs e)
            {

                string contactid = GridView1.DataKeys[e.RowIndex].Value.ToString();
                clsBusinessContactNames cbc = new clsBusinessContactNames();
                try
                {

                    cbc.Delete(contactid);
                    lblMessage1.Text = "Record Deleted Successfully.";
                    lblerror.Text = "";


                }
                catch (Exception ee)
                {
                    lblMessage1.Text = ee.Message.ToString();
                }
                finally
                {
                    cbc = null;
                }
                GridView1.EditIndex = -1;
                //refresh the list
                BindGrid();
           }
           

           
            protected void btnPDF_Click(object sender, ImageClickEventArgs e)
            {

                // step 1
                // need to write to memory first due to IE wanting
                // to know the length of the pdf beforehand
                MemoryStream m = new MemoryStream();
                Document document = new Document(PageSize.A2, 7f, 7f, 7f, 0f);
                try
                {
                    // step 2: we set the ContentType and create an instance of the Writer
                    Response.ContentType = "application/pdf";
                    PdfWriter writer = PdfWriter.GetInstance(document, m);
                    writer.CloseStream = false;

                    // step 3
                    document.Open();

                    // step 4
                    document.Add(new Paragraph(DateTime.Now.ToString()));
                   
                  
                }
                catch (DocumentException ex)
                {
                    Console.Error.WriteLine(ex.StackTrace);
                    Console.Error.WriteLine(ex.Message);
                }

                // step 5: Close document
                 document.Close();

                // step 6: Write pdf bytes to outputstream
                Response.OutputStream.Write(m.GetBuffer(), 0, m.GetBuffer().Length);
                Response.OutputStream.Flush();
                Response.OutputStream.Close();
                m.Close();


              /*  Response.ContentType = "application/pdf";

                Response.AddHeader("content-disposition", "attachment; filename=StudentDetails.pdf");

               
                Response.Cache.SetCacheability(HttpCacheability.NoCache);

                StringWriter sw = new StringWriter();

                HtmlTextWriter hw = new HtmlTextWriter(sw);

                GridView1.AllowPaging = false;

                GridView1.DataBind();

                GridView1.RenderControl(hw);

                GridView1.HeaderRow.Style.Add("width", "15%");

                GridView1.HeaderRow.Style.Add("font-size", "10px");

                GridView1.Style.Add("text-decoration", "none");

                GridView1.Style.Add("font-family", "Arial, Helvetica, sans-serif;");

                GridView1.Style.Add("font-size", "8px");

                StringReader sr = new StringReader(sw.ToString());

                Document pdfDoc = new Document(PageSize.A2, 7f, 7f, 7f, 0f);

                HTMLWorker htmlparser = new HTMLWorker(pdfDoc);

                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

              


                pdfDoc.Open();

                htmlparser.Parse(sr);

                pdfDoc.Close();

                Response.Write(pdfDoc);

                Response.End();*/

            }
            protected void btnCSV_Click(object sender, ImageClickEventArgs e)
            {

                Response.ClearContent();

                Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Student.csv"));

                Response.ContentType = "application/text";

                GridView1.AllowPaging = false;

                GridView1.DataBind();

                StringBuilder strbldr = new StringBuilder();

                for (int i = 0; i < GridView1.Columns.Count; i++)
                {

                    //separting header columns text with comma operator

                    strbldr.Append(GridView1.Columns[i].HeaderText + ',');

                }

                //appending new line for gridview header row

                strbldr.Append("\n");

                for (int j = 0; j < GridView1.Rows.Count; j++)
                {

                    for (int k = 0; k < GridView1.Columns.Count; k++)
                    {

                        //separating gridview columns with comma

                        strbldr.Append(GridView1.Rows[j].Cells[k].Text + ',');

                    }

                    //appending new line for gridview rows

                    strbldr.Append("\n");

                }

                Response.Write(strbldr.ToString());

                Response.End();

            }
            protected void btnWord_Click(object sender, ImageClickEventArgs e)
            {

                GridView1.AllowPaging = false;

                GridView1.DataBind();

                Response.ClearContent();

                Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "Student.doc"));

                Response.Charset = "";

                Response.ContentType = "application/ms-word";

                StringWriter sw = new StringWriter();

                HtmlTextWriter htw = new HtmlTextWriter(sw);

                GridView1.RenderControl(htw);

                Response.Write(sw.ToString());

                Response.End();

            }

           
            /// This Event is used to export gridview data to Excel

          

            protected void btnExcel_Click(object sender, ImageClickEventArgs e)
            {
                

 
             
                Response.Clear();

                Response.Buffer = true;

                Response.AddHeader("content-disposition", "attachment;filename=Student.xls");

                Response.Charset = "";

                Response.ContentType = "application/vnd.ms-excel";

                StringWriter sw = new StringWriter();

                HtmlTextWriter htw = new HtmlTextWriter(sw);

                GridView1.AllowPaging = false;

                GridView1.DataBind();

                //Change the Header Row back to white color

                GridView1.HeaderRow.Style.Add("background-color", "#FFFFFF");

                //Applying stlye to gridview header cells

                for (int i = 0; i < GridView1.HeaderRow.Cells.Count; i++)
                {

                    GridView1.HeaderRow.Cells[i].Style.Add("background-color", "#507CD1");

                }

                int j = 1;

                //This loop is used to apply stlye to cells based on particular row

                foreach (GridViewRow gvrow in GridView1.Rows)
                {

                    gvrow.BackColor = System.Drawing.Color.White;

                    if (j <= GridView1.Rows.Count)
                    {

                        if (j % 2 != 0)
                        {

                            for (int k = 0; k < gvrow.Cells.Count; k++)
                            {

                                gvrow.Cells[k].Style.Add("background-color", "#EFF3FB");

                            }

                        }

                    }

                    j++;
 

                }

                GridView1.RenderControl(htw);
      
                // string style = @"<style> .text { mso-number-format:\@; } </style> ";

                Response.Write(sw.ToString());
            
                Response.Output.Write(sw.ToString());

                Response.Flush();

                Response.End();
            }


      
            protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
            {

            }


            public override void VerifyRenderingInServerForm(Control control)
            {

                /* Verifies that the control is rendered */

            }

            protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
            {

            }

            public int lblTotalstipend { get; set; }

            public Label lblTotal_stipend { get; set; }
        } 

}
