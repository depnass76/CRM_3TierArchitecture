<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="CRM_3TierArchitecture.UserInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<HEAD>
		<title>User Info</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR">
		<meta content="C#" name="CODE_LANGUAGE">
		<meta content="JavaScript" name="vs_defaultClientScript">
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema">
	
<script language="javascript" type="text/javascript">
<!--

function Table1_onclick() {

}

// -->
</script>


    <link href="UserInfo.css" rel="stylesheet" type="text/css" />

</HEAD>
	<body>
			
  <form id="Form1" runat="server">	
     <table cellpadding = "2px" cellspacing="1px" bgcolor="#ffcc66" align ="center" border="0" >
		
		
		<TR bgcolor="#ffffdd">
			<TD width="2px" bgcolor="#ffcc66"></td>
		<td style="width: 584px">
			     <div class="formHeading"> User Info</div>
			
	      <table width="100%" border="0" cellpadding="3px" class="htmlForm" cellspacing="0">     
			
			<tr>
			       <td colspan="2">&nbsp</td>
			    </tr>
			
	
				<tr>
					<td align="left" style="width: 324px">
					<asp:label id="Label10" runat="server" Width="233px">First Name:</asp:label>
					<asp:textbox id="txtFirstName" runat="server" ToolTip="Enter First Name" Width="288px"></asp:textbox>
					</td>
					<td style="width: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat ="server" Text="*" ControlToValidate="txtFirstName" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    
				</tr>
				
				<tr>
					<td align="left" style="width: 324px"><asp:label id="Label3" runat="server" Height="24px" Width="235px">Last Name:</asp:label><asp:textbox id="txtLastName" runat="server" ToolTip="Enter Last Name" Width="288px"></asp:textbox></td>
				    <td style="width: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat ="server" Text="*" ControlToValidate="txtLastName" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    
				</tr>
				
				<tr>
					<td align="left" style="width: 324px"><asp:label id="Label4" runat="server" Height="24px" Width="237px">Email</asp:label><asp:textbox id="txtEmail" runat="server" ToolTip="Enter Email Address" Width="288px"></asp:textbox></td>
				    <td style="width: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat ="server" Text="*" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    
				</tr>
				
				<tr>
					<td align="left" style="height: 35px; width: 324px;"><asp:label id="Label5" runat="server" Height="24px" Width="239px">User Name:</asp:label><asp:textbox id="txtUserName" runat="server" ToolTip="Enter User Name" Width="288px"></asp:textbox></td>
				    <td style="width: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat ="server" Text="*" ControlToValidate="txtUserName" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    
				</tr>
				
				<tr>
					<td align="left" style="width: 324px"><asp:label id="Label6" runat="server" Height="24px" Width="236px">Password:</asp:label><asp:textbox id="txtPassword" runat="server" ToolTip="Enter Password" Width="288px" TextMode="Password"></asp:textbox></td>
				    <td style="width: 21px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat ="server" Text="*" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                    
				</tr>
			
			 
			<tr>
			        <td colspan = "2">&nbsp</td>
			    </tr>
			</table>
		
		
		</td>
	
	           <td valign="top">
	             <ul class="points">
	              
	              <li><asp:hyperlink id="Hyperlink3" runat="server" Height="17px" Width="85px" ForeColor="Black" ToolTip="Sign Off" NavigateUrl="Login.aspx">Sign Off</asp:hyperlink></li>
	              
	             </ul>
	           </td>
	</TR>
			
			
				
				
			 <tr bgcolor="#ffcc66">
			        <td style="height: 20px">&nbsp</td>
					<TD colspan="2" style="height: 20px"><asp:button id="save" runat="server" ToolTip="Save" Height="22px" Width="96px" Text="Save" OnClick="UpdateUser"></asp:button>
                        <asp:button id="Button1" runat="server" Height="22px" Width="96px" ToolTip="Cancel" Text="Cancel" OnClick="cancel_Click"></asp:button>&nbsp;
                    </TD>
				</TR>
		<tr>
			        <td colspan = "2">&nbsp<asp:Label ID="lblMessage1" runat="server" Width="469px"></asp:Label></td>
			    </tr>
			
				
  </table>

            <table style="Z-INDEX: 105; LEFT: -1px; WIDTH: 224px; POSITION: absolute; TOP: 594px; HEIGHT: 25px">
				<TR>
					<TD bgcolor = "#ffcc66">
					  <MARQUEE  loop ="-1" scrollamount ="2">Copyright © 2007 Reda</MARQUEE>
					</TD>
				</TR>
			</table>
			
			<asp:label id="lblerror" style="Z-INDEX: 101; LEFT: 551px; POSITION: absolute; TOP: 449px" runat="server"
				Height="110px" Width="274px"></asp:label>
	</form>

	</body>
</HTML>

