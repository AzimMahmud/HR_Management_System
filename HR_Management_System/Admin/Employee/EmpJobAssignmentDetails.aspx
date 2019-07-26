<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" CodeBehind="EmpJobAssignmentDetails.aspx.cs" Inherits="HR_Management_System.Admin.Employee.EmpJobAssignmentDetails" %>
<%@ Import Namespace="Microsoft.Ajax.Utilities" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="header">Employee Job Details</h2>
    <asp:Label ID="lblHelo" runat="server"></asp:Label>
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <h5 class="card-header">Employee Details</h5>
            <div class="card-body">
                     <div class="text-center table-responsive">
                                <asp:GridView ID="GrdViewEmployeeJobDetails"  OnRowDeleting="GrdViewEmployeeJobDetails_OnRowDeleting" CssClass="table table-striped" runat="server" AllowPaging="True" PageSize="5" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="JobAssignmentID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                
                                    <Columns>

                                        <asp:TemplateField HeaderText="Full Name" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <span><%# Eval("EmpFstName") %> <%# Eval("EmpLstName") %></span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Designation" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("DesignationTitle") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Joining Date" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("JoiningDate") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Joining Salary" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White" >
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("JoiningSalary").ToString().FormatInvariant("C") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Leaving Date" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("LeavingDate").ToString() == "" ? "-----": Eval("LeavingDate") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Status"  ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("IsActive").ToString() == "True" ? "Active" : "InActive"  %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="Command" HeaderStyle-ForeColor="White">
                                        <ItemTemplate>
                                        
                                            <asp:LoginView runat="server">
                                                <RoleGroups>
                                                    <asp:RoleGroup Roles="Admin">
                                                        <ContentTemplate>
                                                            <asp:ImageButton runat="server" ID="imgEdit" CausesValidation="false" OnCommand="imgEdit_Command" ImageUrl="~/Content/icons/edit_icon.svg" CommandArgument='<%# Eval("JobAssignmentID") %>' />
                                                            <asp:ImageButton runat="server" ID="imgDelete" CausesValidation="false" OnCommand="imgDelete_OnCommand" ImageUrl="~/Content/icons/delete_icon.svg" CommandArgument='<%# Eval("JobAssignmentID") %>' OnClientClick="return confirm('Are you sure to delete!!')" />              
                                                        </ContentTemplate>
                                                    </asp:RoleGroup>
                                                </RoleGroups>
                                            </asp:LoginView>
                                        </ItemTemplate>
                                        
                                        </asp:TemplateField>

                                       
                                      
                                        
                                    </Columns>
                            
                                 <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                 <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                 <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                 <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                 <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                 <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                 <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                 <SortedDescendingHeaderStyle BackColor="#242121" />
                            
                             </asp:GridView>
                               
            
                               
                     </div>
                  
                
                   
               
            </div>
        </div>
    </div>
        
</asp:Content>
