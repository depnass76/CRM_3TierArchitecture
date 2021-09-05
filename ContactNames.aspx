<%@ Page language="c#" Codefile="ContactNames.aspx.cs" AutoEventWireup="true" EnableEventValidation ="true" Inherits="CRM_3TierArchitecture.ContactNames" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" >
<html xmlns="http://www.w3.org/1999/xhtml" >
	
<head id="Head1" runat="server">
		
        <title>Contact List</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1"/>
		<meta name="CODE_LANGUAGE" content="C#"/>
		<meta name="vs_defaultClientScript" content="JavaScript"/>
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5"/>
 
 
 


 
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

        <style type="text/css">
            .style3
            {
                height: 23px;
            }
        </style>

        </head>
	
	
	
<body style="background-color:Gray" onload="startTime()">
		
		
		
<form id="form1" runat = "server"  method="post"  style="left: -14px;right:10px;top: 8px">
   <table>
      <tr>
         <td style="width: 3px">
            <div>
               <script type ="text/javascript">document.write(weekday[d.getDay()])</script>
            </div>
         </td>
         <td>
            <div id="txt"></div>
         </td>
       </tr>
    </table>
    
    
    <table  style="width: 1240px">
        <tr> 
	       <td style="width: 156px; height: 23px">You are logged in as:</td>
		   <td colspan="4" style="height: 23px; width: 1118px;">
			   <asp:label id="lbllastname" runat="server" Width="80px" ForeColor="Blue"></asp:label>,
			   <asp:label id="lblfirstname" runat="server" Width="249px" ForeColor="Blue" ></asp:label>
           </td>
	    </tr>
        <tr>
           <td colspan="200" style="width: 614px; height: 19px;">
                <asp:Label ID="lblerror" runat="server" Width="314px" Height="16px" 
                            style="margin-left: 0px"></asp:Label>
           </td>
        </tr>
    </table>
   
   
   
			  <table border="0" cellpadding="8px" class="htmlForm" cellspacing="0" 
                  id="TABLE1"   style="width: 839px; margin-left: 0px;">     
	                     <tr>
                           <td align="right">
                           <asp:ImageButton ID="btnPDF" runat="server" ImageUrl="Images/PDF.jpg"  Width="30px" Height="30px" onclick="btnPDF_Click" style="margin-bottom: 0px"/>
                                  
                           <asp:ImageButton ID="btnCSV" runat="server" ImageUrl="Images/CSVImage.jpg" Width="30px" Height="30px" onclick="btnCSV_Click" style="margin-left: 0px"/>
                                  
                           <asp:ImageButton ID="btnExcel" runat="server" ImageUrl="Images/ExcelImage.jpg" Width="30px" Height="30px" onclick="btnExcel_Click" style="margin-left: 0px"  />
                           
                           <asp:ImageButton ID="btnWord" runat="server" ImageUrl="Images/WordImage.jpg" Width="30px" Height="30px" onclick="btnWord_Click" style="margin-left: 0px" />
                           </td> 
                         </tr>
                        
                        
                        
                        <tr style="height: 18px; width: 147px;">
                            
                            
                            <td>
                             <asp:GridView ID="GridView1" runat="server" DataKeyNames="contactid" 
                                    AllowPaging ="false" PageSize="5"  
                             AllowSorting="false" AutoGenerateColumns="false"  
                                    OnRowCommand="grd_RowCommand_names" OnRowEditing="EditRecordList"
                             OnRowDeleting="DeleteRecordList"  OnRowUpdating="UpdateRecordList" 
                                    OnRowCancelingEdit="CancelRecordList" 
                             ShowFooter="True" Width="845px" CellPadding="4" ForeColor="#333333" 
                                    Height="150px" ShowHeaderWhenEmpty="True" 
                                    onselectedindexchanged="GridView1_SelectedIndexChanged1">
                 
                                <RowStyle BackColor="#b7e9ff" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="true" ForeColor="White" />

                                <FooterStyle Font-Bold="true" BackColor="#61A6F8" ForeColor="black" />
                               
                                          <Columns>
                                           

                                            <asp:TemplateField HeaderText="Student Depaul ID #">
                                                    <HeaderTemplate>                                                    
                                                      <asp:Label ID="lblCol0" runat="server" Text = "Student Depaul ID #"/>
                                                    </HeaderTemplate>
                                                   
                                                    <EditItemTemplate> 
                                                        
                                                        <asp:TextBox ID="txt_contactid"  runat="server" Text='<%# Bind("contactid") %>'></asp:TextBox> 
                                                        <asp:RequiredFieldValidator ID="rfvStudentEmployeeId" ValidationGroup="Update" runat="server"
                                                           ControlToValidate="txt_contactid" ErrorMessage="Please Enter Student Employee Code"
                                                           ToolTip="Please Enter Employee Code" SetFocusOnError="true" 
                                                           ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="reStudentEmployeeId" runat="server" 
                                                            ControlToValidate="txt_contactid"
                                                            ErrorMessage="Please Enter Only Numbers in Student Employee Code" 
                                                            ToolTip="Please Enter Only Numbers"
                                                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$"
                                                            ValidationGroup="Update">*</asp:RegularExpressionValidator>

                                                    </EditItemTemplate> 
                                                   
                                                    <ItemTemplate> 
                                                        <asp:Label ID="contactid" runat="server" Text='<%# Bind("contactid") %>'></asp:Label> 
                                                    </ItemTemplate>
                                                    
                                                     <FooterTemplate> 
                                                           <asp:TextBox ID="txt_contactid" runat="server" ></asp:TextBox>                                                        
                                                           <asp:RequiredFieldValidator ID="rfvStudentEmployeeId" ValidationGroup="Insert" runat="server"
                                                                ControlToValidate="txt_contactid" ErrorMessage="Please Enter Student Employee Code"
                                                                ToolTip="Please Enter Student Employee Code" SetFocusOnError="true" 
                                                                ForeColor="Red">*</asp:RequiredFieldValidator>
                                                           <asp:RegularExpressionValidator ID="reStudentEmployeeId" runat="server" 
                                                               ControlToValidate="txt_contactid"
                                                               ErrorMessage="Please Enter Only Numbers in Student Employee Code" 
                                                               ToolTip="Please Enter Only Numbers"
                                                               SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$" 
                                                               ValidationGroup="Insert">*</asp:RegularExpressionValidator>

                                                     </FooterTemplate>  

                                                     <HeaderStyle HorizontalAlign="Left" />
                                            </asp:TemplateField> 
                  
                                            <asp:TemplateField HeaderText="Student Employee Last Name"> 
                                                 <HeaderTemplate>                                                
                                                 <asp:Label ID="lblCol1" runat="server" Text = "Student Employee Last Name"/>
                                                 </HeaderTemplate>
                                                 
                                                 <EditItemTemplate> 
                                                   <asp:TextBox ID="txt_last_name" runat="server" Text='<%# Bind("lastname") %>'></asp:TextBox> 
                                                   <asp:RequiredFieldValidator ID="rfvStudentEmployeeLastName" ValidationGroup="Update" runat="server"
                                                       ControlToValidate="txt_last_name" ErrorMessage="Please Enter Last Name" 
                                                       ToolTip="Please Enter Last Name"
                                                       SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                 </EditItemTemplate>                     
                                                
                                                 <ItemTemplate> 
                                                   <asp:Label ID="lastname" runat="server" Text='<%# Bind("lastname") %>'></asp:Label> 
                                                 </ItemTemplate>
                                                 
                                                 <FooterTemplate> 
                                                   
                                                   <asp:TextBox ID="txt_last_name" runat="server" ></asp:TextBox>
                                                   <asp:RequiredFieldValidator ID="rfvEmployeeLastName" ValidationGroup="Insert" runat="server"
                                                        ControlToValidate="txt_last_name" ErrorMessage="Please Enter Last Name" 
                                                        ToolTip="Please Enter Last Name"
                                                        SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>

                                                 </FooterTemplate> 
                                                  <HeaderStyle HorizontalAlign="Left" />
                                             </asp:TemplateField>
                
                                              <asp:TemplateField HeaderText="Student Employee First Name">                 
                                                        <HeaderTemplate>                                                           
                                                            <asp:Label ID="lblCol2" runat="server" Text = "Student Employee First Name"/>
                                                        </HeaderTemplate>
                                                        <EditItemTemplate> 
                                                            <asp:TextBox ID="txt_first_name" runat="server" Text='<%# Bind("firstname") %>'></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvStudentEmployeeFirstName" ValidationGroup="Update" runat="server"
                                                                  ControlToValidate="txt_first_name" ErrorMessage="Please Enter First Name" 
                                                                  ToolTip="Please Enter First Name"
                                                                  SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator> 
                                                        </EditItemTemplate>                    
                                                        <ItemTemplate> 
                                                            <asp:Label ID="firstname" runat="server" Text='<%# Bind("firstname") %>'></asp:Label> 
                                                        </ItemTemplate>
                                                        <FooterTemplate> 
                                                           <asp:TextBox ID="txt_first_name" runat="server" ></asp:TextBox>
                                                           <asp:RequiredFieldValidator ID="rfvEmployeeFirstName" ValidationGroup="Insert" runat="server"
                                                               ControlToValidate="txt_first_name" ErrorMessage="Please Enter First Name" 
                                                               ToolTip="Please Enter First Name"
                                                               SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        </FooterTemplate>                   
                                                        <HeaderStyle HorizontalAlign="Left" />
                                               </asp:TemplateField>
                                                  

                                               <asp:TemplateField HeaderText="Student E-mail"> 
                                                       <HeaderTemplate>                                                        
                                                         <asp:Label ID="lblCol3" runat="server" Text = "Student E-mail"/>
                                                       </HeaderTemplate>                     
                                                       <EditItemTemplate> 
                                                           <asp:TextBox ID="txt_email" runat="server" Text='<%# Bind("email") %>'></asp:TextBox> 
                                                           <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="Insert" runat="server"
                                                               ControlToValidate="txt_email" ErrorMessage="Please Enter Email" ToolTip="Please Enter Email"
                                                               SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                           <asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="txt_email"
                                                                    ErrorMessage="Please Enter a Valid Email" ToolTip="Please Enter a Valid Email"
                                                                    SetFocusOnError="true" ForeColor="Red" 
                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                    ValidationGroup="Insert">*</asp:RegularExpressionValidator>
                                                       </EditItemTemplate>                      
                                                       <ItemTemplate> 
                                                           <asp:Label ID="email" runat="server" Text='<%# Bind("email") %>'></asp:Label> 
                                                       </ItemTemplate>                 
                                                       <FooterTemplate> 
                                                           <asp:TextBox ID="txt_email" runat="server" ></asp:TextBox>
                                                           <asp:RequiredFieldValidator ID="rfvEmail" ValidationGroup="Update" runat="server"
                                                               ControlToValidate="txt_email" ErrorMessage="Please Enter Email" ToolTip="Please Enter Email"
                                                               SetFocusOnError="true" ForeColor="Red">*</asp:RequiredFieldValidator>
                                                           <asp:RegularExpressionValidator ID="reEmail" runat="server" ControlToValidate="txt_email"
                                                                    ErrorMessage="Please Enter a Valid Email" ToolTip="Please Enter a Valid Email"
                                                                    SetFocusOnError="true" ForeColor="Red" 
                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                    ValidationGroup="Insert">*</asp:RegularExpressionValidator>

                                                       </FooterTemplate>
                                                       <HeaderStyle HorizontalAlign="Left" />
                                               </asp:TemplateField>
                   
                                                                                                                                                 
             
                                              <asp:TemplateField HeaderText="Student Phone (Cell Prefered)">
                                                      <HeaderTemplate>                                                         
                                                          <asp:Label ID="lblCol4" runat="server" Text = "Student Phone (Cell Prefered)"/>
                                                      </HeaderTemplate>    
                                                      <EditItemTemplate> 
                                                           <asp:TextBox ID="txt_phone_number" runat="server" Text='<%# Bind("phNumber") %>'></asp:TextBox> 
                                                            <asp:RequiredFieldValidator ID="rfvStudentPhone" ValidationGroup="Update" runat="server"
                                                           ControlToValidate="txt_phone_number" ErrorMessage="Please Enter Student Employee Phone Number"
                                                           ToolTip="Please Enter Student Employee Phone Number" SetFocusOnError="true" 
                                                           ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="reStudentPhone" runat="server" 
                                                            ControlToValidate="txt_phone_number"
                                                            ErrorMessage="Please Enter Only Phone Numbers in Student Employee Code" 
                                                            ToolTip="Please Enter Only Phone Numbers"
                                                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$"
                                                            ValidationGroup="Update">*</asp:RegularExpressionValidator>
                                                      </EditItemTemplate>                   
                                                      <ItemTemplate> 
                                                           <asp:Label ID="phNumber" runat="server" Text='<%# Bind("phNumber") %>'></asp:Label> 
                                                      </ItemTemplate>
                                                      <FooterTemplate> 
                                                           <asp:TextBox ID="txt_phone_number" runat="server" ></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="rfvStudentPhone" ValidationGroup="Insert" runat="server"
                                                           ControlToValidate="txt_phone_number" ErrorMessage="Please Enter Student Employee Phone Number"
                                                           ToolTip="Please Enter Student Employee Phone Number" SetFocusOnError="true" 
                                                           ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="reStudentPhone" runat="server" 
                                                            ControlToValidate="txt_phone_number"
                                                            ErrorMessage="Please Enter Only Phone Numbers in Student Employee Code" 
                                                            ToolTip="Please Enter Only Phone Numbers"
                                                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$"
                                                            ValidationGroup="Insert">*</asp:RegularExpressionValidator>
                                                      </FooterTemplate>
                                                      <HeaderStyle HorizontalAlign="Left" />
                                               </asp:TemplateField>
                   
                                  
                  
                                                <asp:TemplateField HeaderText="Autumn">
                                                        <HeaderTemplate>                                                       
                                                          <asp:Label ID="lblCol5" runat="server" Text = "Autumn"/>
                                                        </HeaderTemplate> 
                                                        <EditItemTemplate> 
                                                          <asp:TextBox ID="txt_autumn" runat="server" Text='<%# Bind("autumn") %>'></asp:TextBox> 
                                                          <asp:RequiredFieldValidator ID="rfvAutumn" ValidationGroup="Update" runat="server"
                                                           ControlToValidate="txt_autumn" ErrorMessage="Please Enter Student Employee Amount"
                                                           ToolTip="Please Enter Student Employee Amount " SetFocusOnError="true" 
                                                           ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="reAutumn" runat="server" 
                                                            ControlToValidate="txt_autumn"
                                                            ErrorMessage="Please Enter Only Amount" 
                                                            ToolTip="Please Enter Only Amount"
                                                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$"
                                                            ValidationGroup="Update">*</asp:RegularExpressionValidator>
                                                        </EditItemTemplate>                     
                                                        <ItemTemplate> 
                                                          <asp:Label ID="autumn" runat="server" Text='<%# Bind("autumn") %>' ></asp:Label>   
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                          <asp:TextBox ID="txt_autumn" runat="server" ></asp:TextBox>
                                                           <asp:RequiredFieldValidator ID="rfvAutumn" ValidationGroup="Insert" runat="server"
                                                           ControlToValidate="txt_autumn" ErrorMessage="Please Enter Student Employee Amount"
                                                           ToolTip="Please Enter Student Employee Amount " SetFocusOnError="true" 
                                                           ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="reAutumn" runat="server" 
                                                            ControlToValidate="txt_autumn"
                                                            ErrorMessage="Please Enter Only Amount" 
                                                            ToolTip="Please Enter Only Amount"
                                                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$"
                                                            ValidationGroup="Insert">*</asp:RegularExpressionValidator>
                                                        </FooterTemplate>
                                                        <HeaderStyle HorizontalAlign="Left" />
                                                </asp:TemplateField>
                  
                  
                                               <asp:TemplateField HeaderText="Winter">
                                            <HeaderTemplate>                                           
                                              <asp:Label ID="lblCol6" runat="server" Text = "Winter"/>
                                            </HeaderTemplate> 
                                                <EditItemTemplate> 
                                                   <asp:TextBox ID="txt_winter" runat="server" Text='<%# Bind("winter") %>' ></asp:TextBox> 
                                                   <asp:RequiredFieldValidator ID="rfvWinter" ValidationGroup="Update" runat="server"
                                                           ControlToValidate="txt_winter" ErrorMessage="Please Enter Student Employee Amount"
                                                           ToolTip="Please Enter Student Employee Amount " SetFocusOnError="true" 
                                                           ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="reWinter" runat="server" 
                                                            ControlToValidate="txt_winter"
                                                            ErrorMessage="Please Enter Only Amount" 
                                                            ToolTip="Please Enter Only Amount"
                                                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$"
                                                            ValidationGroup="Update">*</asp:RegularExpressionValidator>
                                                </EditItemTemplate> 
                    
                                                <ItemTemplate> 
                                                   <asp:Label ID="winter" runat="server" Text='<%# Bind("winter") %>'></asp:Label>   
                                                </ItemTemplate>

                                                <FooterTemplate>
                                                   <asp:TextBox ID="txt_winter" runat="server" ></asp:TextBox>
                                                   <asp:RequiredFieldValidator ID="rfvWinter" ValidationGroup="Insert" runat="server"
                                                           ControlToValidate="txt_winter" ErrorMessage="Please Enter Student Employee Amount"
                                                           ToolTip="Please Enter Student Employee Amount " SetFocusOnError="true" 
                                                           ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="reWinter" runat="server" 
                                                            ControlToValidate="txt_winter"
                                                            ErrorMessage="Please Enter Only Amount" 
                                                            ToolTip="Please Enter Only Amount"
                                                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$"
                                                            ValidationGroup="Insert">*</asp:RegularExpressionValidator>
                                                </FooterTemplate>

                                                 <HeaderStyle  HorizontalAlign="Left" />
                                             </asp:TemplateField>
                  
                                            <asp:TemplateField HeaderText="Spring">
                                                    <HeaderTemplate>                                                     
                                                      <asp:Label ID="lblCol7" runat="server" Text = "Spring"/>
                                                    </HeaderTemplate> 
                                                    <EditItemTemplate> 
                                                       <asp:TextBox ID="txt_spring" runat="server" Text='<%# Bind("spring") %>'></asp:TextBox> 
                                                        <asp:RequiredFieldValidator ID="rfvSpring" ValidationGroup="Update" runat="server"
                                                           ControlToValidate="txt_spring" ErrorMessage="Please Enter Student Employee Amount"
                                                           ToolTip="Please Enter Student Employee Amount " SetFocusOnError="true" 
                                                           ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="reSpring" runat="server" 
                                                            ControlToValidate="txt_spring"
                                                            ErrorMessage="Please Enter Only Amount" 
                                                            ToolTip="Please Enter Only Amount"
                                                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$"
                                                            ValidationGroup="Update">*</asp:RegularExpressionValidator>
                                                    </EditItemTemplate>                  
                                                    <ItemTemplate> 
                                                       <asp:Label ID="spring" runat="server" Text='<%# Bind("spring") %>'></asp:Label>   
                                                     </ItemTemplate>
                                                     <FooterTemplate>
                                                       <asp:TextBox ID="txt_spring" runat="server" ></asp:TextBox>
                                                         <asp:RequiredFieldValidator ID="rfvSpring" ValidationGroup="Insert" runat="server"
                                                           ControlToValidate="txt_spring" ErrorMessage="Please Enter Student Employee Amount"
                                                           ToolTip="Please Enter Student Employee Amount " SetFocusOnError="true" 
                                                           ForeColor="Red">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="reSpring" runat="server" 
                                                            ControlToValidate="txt_spring"
                                                            ErrorMessage="Please Enter Only Amount" 
                                                            ToolTip="Please Enter Only Amount"
                                                            SetFocusOnError="true" ForeColor="Red" ValidationExpression="^\d+$"
                                                            ValidationGroup="Insert">*</asp:RegularExpressionValidator>
                                                     </FooterTemplate>
                                                   
                                                                                                                                    			                                                                                                                                        
                                             
                                           </asp:TemplateField>
                                              
                                           
                                           <asp:TemplateField HeaderText="Total Stipend" >                                                                                                                                                                         
                                                                           
                                       
                                            <EditItemTemplate>
                                              <asp:Label ID="lblTotal_stipend" runat="server"  Text='<%# (Convert.ToDouble(Eval("autumn")) + Convert.ToDouble(Eval("winter")) + Convert.ToDouble(Eval("spring"))).ToString() %>' />
                                             </EditItemTemplate> 
                                             <ItemTemplate>
                                             <asp:Label ID="lblTotal_stipend" runat="server"  Text='<%# (Convert.ToDouble(Eval("autumn")) + Convert.ToDouble(Eval("winter")) + Convert.ToDouble(Eval("spring"))).ToString() %>' />
                                             </ItemTemplate> 

                                             
                                            
                                            <FooterTemplate>
                                               <asp:Label ID="lblTotal" runat="server" Text= '<%# (Convert.ToDouble(Eval("autumn")) + Convert.ToDouble(Eval("winter")) + Convert.ToDouble(Eval("spring"))).ToString() %>'></asp:Label> 
                                            </FooterTemplate>
 
                                                             
                                            </asp:TemplateField> 

                                          <asp:TemplateField HeaderText="Status" FooterStyle-ForeColor="Black">
                                                 
                                                  <HeaderTemplate>
                                                      <asp:Label ID="lblCol9" runat="server" Text = "Status"/>
                                                  </HeaderTemplate> 
                                                 
                                                  <EditItemTemplate> 
                                                        <asp:DropDownList ID="cmbType" runat="server" Text='<%# Eval("status") %>'> 
                                                         <asp:ListItem Text=" " Value=" " Selected="true"></asp:ListItem>
                                                         <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>                                                        
                                                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem> 
                                                        <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                                                        </asp:DropDownList> 
                                                   </EditItemTemplate> 
                                                   
                                                   <ItemTemplate> 
                                                        <asp:Label ID="lblStatus" runat="server"  Text='<%# Eval("status") %>'></asp:Label> 
                                                   </ItemTemplate>                                                         
                                                   
                                                   <FooterTemplate> 
                                                        <asp:DropDownList ID="cmbType" runat="server"> 
                                                         <asp:ListItem Text=" " Value=" " Selected="True"></asp:ListItem>
                                                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>                                                        
                                                        <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem> 
                                                        <asp:ListItem Text="Cancelled" Value="Cancelled"></asp:ListItem>
                                                        </asp:DropDownList> 
                                                    </FooterTemplate> 
                                                               
                                        </asp:TemplateField> 

                   
                 
               
                                              <asp:TemplateField HeaderText="Delete?">  
                                                      <HeaderTemplate>
                                                        <asp:Label ID="lblCol10" runat="server" Text = "Delete"/>
                                                       </HeaderTemplate>
                                                       <ItemTemplate>
                                                          <span onclick="return confirm('Are you sure to Delete?.')">
                                                           <asp:LinkButton ID="LinkBD" runat="server" Text="Delete" CommandName="Delete">
                                                           </asp:LinkButton>
                                                          </span>
                                                       </ItemTemplate>
                                              </asp:TemplateField>
                                             
                                             
                                              <asp:TemplateField HeaderText="Edit" ShowHeader="false"> 
                                                      <HeaderTemplate>
                                                        <asp:Label ID="lblCol11" runat="server" Text = "Update"/>
                                                      </HeaderTemplate>
                                                      <EditItemTemplate> 
                                                        <asp:LinkButton ID="lbkUpdate" runat="server"  CausesValidation="false" CommandName="Update" Text="Update"></asp:LinkButton> 
                                                        <asp:LinkButton ID="lnkCancel" runat="server"  CausesValidation="false" CommandName="Cancel" Text="Cancel"></asp:LinkButton> 
                                                      </EditItemTemplate> 
                                                       <FooterTemplate> 
                                                         <asp:LinkButton ID="lbkInsert" runat="server" CausesValidation="False" CommandName="Insert" Text="Insert"  ForeColor="red" Font-Bold="true"></asp:LinkButton>                                                    
                                                       </FooterTemplate> 
                                                      <ItemTemplate> 
                                                        <asp:LinkButton ID="lnkEdit" runat="server"  CausesValidation="false" CommandName="Edit" Text="Edit"></asp:LinkButton> 
                                                      </ItemTemplate>
                                                      <HeaderStyle HorizontalAlign="Left" />
                                             </asp:TemplateField> 
                                                                                                                                                                                                                   
                                        </Columns>
                     
                         </asp:GridView>  
                                    
                    
                  
                        
			   
               
                                                      
                        <asp:Label ID="lblMessage1" runat="server" Width="460px"></asp:Label>
      
          </tr>
	</td>
			   
						
     </table>
	             <table>
                  <tr>  
                   <td  style="color:Red" colspan="1" class="style3">Total Amount:</td>                
                   <asp:Label ID="lblAmount" runat="server"></asp:Label>   
                 </tr>  
                  <tr>  
                   <td style=" color:Red"  rowspan="1"  >Remaining Amount:</td>                
                   <asp:Label ID="lblRemainingAmount" runat="server"></asp:Label>   
                 </tr>      
                 </table>       	          				    
</form>                
</body>
</html>
