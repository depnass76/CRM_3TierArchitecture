<%@ Page Language="C#" AutoEventWireup="true" Codefile="Login.aspx.cs" Inherits="CRM_3TierArchitecture.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login Page</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="C#" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
	
<script language="javascript" type="text/javascript">


function TABLE1_onclick() {

}

function TABLE1_onclick() {

}

function TABLE1_onclick() {

}

function TABLE1_onclick() {

}


</script>

        
        
        
     <script type="text/javascript">

function startTime()
{
  var today= new Date();
  var h=today.getHours();
  var m=today.getMinutes();
  var s=today.getSeconds();
  
  m=checkTime(m);
  s=checkTime(s);
  
  document.getElementById('txt').innerHTML=h+":"+m+":"+s;
  
  t=setTimeout('startTime()',500);
  
 }
 
 function checkTime(i)
 {
   if(i<10)
   {
     i="0"+i;
   }
   
  return i;
 }
 
</script>

<script type="text/javascript">

 var d=new Date();
 var weekday= new Array(7);
 weekday[0]="sunday";
 weekday[1]="Monday";
 weekday[2]="Tuesday";
 weekday[3]="Wednesday";
 weekday[4]="Thursday";
 weekday[5]="Friday";
 weekday[6]="Saturday";
 
</script>



   
    <link href="Login.css" rel="stylesheet" type="text/css" />
    


    <style type="text/css">
        .style1
        {
            width: 297px;
        }
        .style2
        {
            height: 26px;
            width: 200px;
        }
        .style3
        {
            height: 27px;
            width: 200px;
        }
        .style4
        {
            height: 16px;
            width: 200px;
        }
    </style>
    


</head>
	
    <body style=" background-color:Gray"  onload="startTime()" >
		
        <form id="Form1" runat="server">

			
			  
			  
			  <table><tr bgcolor="#b7e9ff"><td style="width: 3px" bgcolor="#b7e9ff"><div><script type="text/javascript">document.write(weekday[d.getDay()])</script></div></td><td><div id="txt"></div></td></tr></table>
                
                
                <table class="tableBorder"  align="center" 
                cellpadding="2px" cellspacing="1px" 
                style="width: 364px; background-color:White; border-color:Black;  height: 176px" >
             
                <tr>
                    <td style="background-color:Blue"  colspan="4">&nbsp;&nbsp;&nbsp;</td>
                </tr>
                
                <tr
                    <td colspan="4" style="background-color:White" class="label">&nbsp;</td>
                </tr>
               
                
                <tr>
                    <td align="center" style="background-color:White;color:Black; height: 22px "  colspan="4" class="label" ><span style="color:Black">LogIn</span></td>
                </tr>
                
                <tr>
                    <td colspan="4"  style="background-color:White;height: 11px; " class="label">&nbsp;</td>
                </tr>
                
                <tr>
                    <td style="width: 90px;  background-color:White; color:Black; height: 26px;" align="left" class="label" > User ID:</td>
                    <td align= "left" bgcolor="#b7e9ff" class="style2"> 
                    <asp:textbox id="txtusname" runat="server" Width="233px" ToolTip="Enter user name"   BackColor="White" BorderColor="White" ForeColor="Black" AutoPostBack="True" CausesValidation="True"></asp:textbox>
                    </td>
                    <td style="background-color:White"  style="width: 21px">
                    <asp:RequiredFieldValidator ID="requiredFieldValidator1" runat ="server" Text="*" ControlToValidate="txtusname" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                   
                </tr>
                
                <tr>
                    <td style="width: 90px; background-color:White; color:Black; height: 26px" align = "left" class ="label">Password:</td>
                    <td class="style3">
                    <asp:textbox id="txtpass" runat="server" Width="234px" ToolTip="Enter password" BackColor="White" BorderColor="White" ForeColor="black" TextMode="Password"></asp:textbox>
                    </td>
                    <td style="background-color:White;width: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat ="server" Text="*" ControlToValidate="txtpass" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    
                    
                   
                </tr>
                
                <tr>
                   <td style="background-color:White"  class= "label" align="right"></td>
                   <td style=" background-color:White; " class="style4">
                   <asp:button id="LoginIn" runat="server" Height="25px" Width="80px" ToolTip="login" Text="Login"></asp:button></td>
                </tr>
               
                 <tr>
                   <td style="background-color:White" align ="left" colspan="4" class= "label"><asp:HyperLink ID="HyperLink3" ForeColor="Black" runat="server" NavigateUrl="UserInfo.aspx">Change User Name and Password ?</asp:HyperLink>
                   </td>
                </tr>
                <tr>
                   <td style="background-color:White"  align ="left" colspan="4" class = "label" ><asp:HyperLink ID="HyperLink4" runat="server" ForeColor="Black" NavigateUrl="GetUserInfo.aspx">Forgot Password ?</asp:HyperLink>
                   </td>
                </tr>
                
                <tr>
                   <td style="background-color:White"  class= "label" colspan="4"  align="left"> 
                   <asp:CheckBox ID="CheckBox" runat="server" Text="Remember your username and password?" Font-Bold="True" Font-Size="Small" ForeColor="black" Checked="True" />
                   </td>
                </tr>
        
                <tr>
                    <td style="background-color:White; height: 11px"  colspan="4" class="label" >&nbsp;</td>
                </tr>
               
            </table>
            <table class="label_3">
                 <tr>
		         <td  >
				 Copyright © 2012	
		         </td>
		         </tr>  
		    </table>

  </form>
 
 </body>

</html>