using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ContactNames_Data;
using CRM_3TierArchitecture;


namespace Business_ContactNames
{
    public class clsBusinessContactNames
    {
        protected System.Web.UI.WebControls.DataGrid DataGrid1;

        public DataTable LoadContactNames()
        {
            clsDataContactNames cdc = new clsDataContactNames();
            try
            {
                return cdc.LoadContactNames();
            }
            catch
            {
                throw;
            }
            finally
            {
                cdc = null;
            }
        }



        //Delete Record from database

        public int Delete(string contactid)
        {
            clsDataContactNames cdc = new clsDataContactNames();
            try
            {
                return cdc.Delete(contactid);
            }
            catch
            {
                throw;
            }
            finally
            {
                cdc = null;
            }

        }
        public int Update(string contactid, string firstname, string lastname, string email, string phNumber, Decimal autumn, Decimal winter, Decimal spring, string status)
        {


            clsDataContactNames cdc = new clsDataContactNames();
            try
            {

                return cdc.Update(contactid, firstname, lastname, email, phNumber, autumn, winter,spring, status);
            }
            catch
            {
                throw;
            }
            finally
            {
                cdc = null;
            }
        }


        public int Insert(string contactid, string firstname, string lastname, string email, string phNumber, Decimal autumn, Decimal winter, Decimal spring, string status)
        {


            clsDataContactNames cdc = new clsDataContactNames();
          
            
            try
            {

                return cdc.Insert(contactid, firstname, lastname, email, phNumber, autumn, winter, spring, status);
            }
            catch
            {
                throw;
            }
            finally
            {
                cdc = null;
            }
        }
        internal string GetType(int typeId)
        {
            throw new Exception("The method or operation is not implemented.");
        }
    }
}
