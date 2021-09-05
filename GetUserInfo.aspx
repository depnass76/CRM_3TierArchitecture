<%@ Page Language="C#" AutoEventWireup="true" Codefile="GetUserInfo.aspx.cs" Inherits="CRM_3TierArchitecture.GetUserInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
		<title>GetUserInfo</title>
		<meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR"/>
		<meta content="C#" name="CODE_LANGUAGE"/>
		<meta content="JavaScript" name="vs_defaultClientScript"/>
		<meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema"/>
	
<script language="javascript" type="text/javascript">
<!--

function TABLE1_onclick() {

}

function TABLE1_onclick() {

}

// -->
</script>


<script type="text/javascript">

function blinklink()
{
  if(!document.getElementById('blink').style.color)
  {
    document.getElementById('blink').style.color="red";
  }
  if(document.getElementById('blink').style.color=="red")
  {
    document.getElementById('blink').style.color="black";
  }
  else
  {
    document.getElementById('blink').style.color="red";
  }
 timer=setTimeout("blinklink()",100);
 }
 
 function stoptimer()
 {
  clearTimeout(timer);
 }

</script>


	

    <link href="GetUserInfo.css" rel="stylesheet" type="text/css" />


	
</HEAD>
	<body onload="blinklink()" onunload="stoptimer()" >
  
		 	
		 <td style="height: 197px">
			   
			  <asp:datagrid  id="DataGrid1" style="Z-INDEX: 104; LEFT: 445px; POSITION: absolute; TOP: 79px" runat="server" Width="155px" Height="1px" AutoGenerateColumns="False" Font-Size="Smaller" Font-Bold="True" OnSelectedIndexChanged="DataGrid1_SelectedIndexChanged">
				
				      <HeaderStyle Font-Size="Smaller" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
				
				      <Columns>
					      <asp:BoundColumn DataField="username" HeaderText="User Name"></asp:BoundColumn>
					      <asp:BoundColumn DataField="password" HeaderText="User Password"></asp:BoundColumn>
				      </Columns>
			  
			 </asp:datagrid>
		</td>
	
	
	
<form  id="form2" method="post" runat="server" style="left: 200px; width: 423px; top: 5px; height: 172px">
		
<table cellpadding = "2px" cellspacing="1px" bgcolor="#ffcc66" align ="center" border="0" style="width: 594px" >
	<tr bgcolor="#ffffdd">
		<td width="2px" bgcolor="#ffcc66" style="height: 174px"></td>
		  <td width="400px" style="height: 174px">
	      
	        <div id="blink"><script language= "javascript">document.write(""+ document.lastModified+"");function TABLE1_onclick() {} </script></div>
	      
	      <table width="100%" cellpadding = "2px" cellspacing="1px" border="0">
			
			<tr>
			  <td colspan="4" style="height: 21px">&nbsp</td>
			</tr>	
		    <tr>
		    
		      <TD colspan="4" align ="center" class ="label"><span>Password Assistance</span></td>
	        </TR>
	  
	        <tr>
		      <td colspan="4" style="height: 23px">&nbsp</td>
	        </tr>
	  
	        <tr>
	          
	          <td style="width: 145px; height: 42px;"class="label"><span>Please enter your email:</span></td>
	          <td style="height: 42px"><asp:textbox id="txtmail" runat="server" ToolTip="Enter yout email" Width="200px"></asp:textbox></td>
              <td style="height: 42px">
                  <asp:Button ID="sbutton" runat="server" OnClick="sbutton_Click" Text="Submit" /></td>
            
	        </tr>
	        
	        <tr>
	        <td colspan="4">&nbsp;</td> 
	        </tr>   
	      
	      </table>
	  
       </td>
       <td valign="top" style="height: 174px; width: 161px;">
	        <ul class="points">
	              <li><asp:hyperlink id="Hyperlink1" runat="server"  ForeColor="Black" ToolTip="Sign Off" NavigateUrl="Login.aspx">Sign Off</asp:hyperlink></li>
	        </ul>
	   </td>
			
	  
	
	 <tr bgcolor="#ffcc66">
	    <td style="height: 23px">&nbsp</td> 
	   <td style="height: 23px; width: 148px;">
           <asp:Label ID="lblcheckemail" runat="server" Width="400px"></asp:Label></td> 
		
     </tr>
	        
</table>

<td>
			<asp:label id="lblerror" style="Z-INDEX: 103; LEFT: 239px; POSITION: absolute; TOP: 594px" runat="server" Width="680px" Height="35px"></asp:label>
			</td>
</form>

		
	       <table style="Z-INDEX: 105; LEFT: -1px; WIDTH: 224px; POSITION: absolute; TOP: 594px; HEIGHT: 25px">
				<tr>
					<td bgcolor = "#ffcc66">
						Copyright © 2012 Reda	
					</td>
				</tr>
			</table>
           
			
			
			
			
		
		
		
		
		
		
	</body>
</html>
