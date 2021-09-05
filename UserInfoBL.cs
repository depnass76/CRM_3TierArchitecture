using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Data_UserInfo;

namespace Business_UserInfo
{
    public class UserInfoBl
    {
        public int UpdateUser(string firstname, string lastname, string username, string password, string email)
        {


            UserInfoDL cdI = new UserInfoDL();
            try
            {

                return cdI.UpdateUser(firstname, lastname, username, password, email);
            }
            catch
            {
                throw;
            }
            finally
            {
                cdI = null;
            }
        }
    }
}
