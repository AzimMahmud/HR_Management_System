<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" CodeBehind="DesignationDetails.aspx.cs" Inherits="HR_Management_System.Admin.Employee.DesignationDetils" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=18.1.1.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

    
    <h2 class="header">Designation Details</h2>

    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <div class="card-body">

                <asp:Button runat="server" OnClick="OnClick" ID="btnAddDesignation" Text="Add Designation" CssClass="btn-payment float-right btn btn-primary"/>
                     <div class="text-center table-responsive">

                                <asp:GridView  ID="GrdViewDesignation" OnRowDeleting="GrdViewDesignation_OnRowDeleting" CssClass="table table-striped" runat="server" AllowPaging="True" PageSize="5" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DesignationID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                
                                    <Columns>

                                        <asp:TemplateField HeaderText="Designation"  ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("DesignationTitle") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Designation"  ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Comment") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                    <asp:TemplateField HeaderText="Command" HeaderStyle-ForeColor="White">
                                    <ItemTemplate>
                                        
                                        <asp:LoginView runat="server">
                                            <RoleGroups>
                                                <asp:RoleGroup Roles="Admin">
                                                    <ContentTemplate>
                                                       
                                                                <asp:ImageButton runat="server" ID="imgEdit" CausesValidation="false" OnCommand="imgEdit_OnCommand" ImageUrl="~/Content/icons/edit_icon.svg" CommandArgument='<%# Eval("DesignationID") %>' />
                                                                <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" OnCommand="btnDelete_OnCommand" CommandName="Delete" Text="Delete" ImageUrl="~/Content/icons/delete_icon.svg" CommandArgument='<%# Eval("DesignationID") %>' OnClientClick="return confirm('Are you sure to delete?')" />
                                            
                                                
                                               

                                                          

                                                        
                                                    </ContentTemplate>
                                                </asp:RoleGroup>
                                            </RoleGroups>
                                        </asp:LoginView>
                                    </ItemTemplate>
                                        <ControlStyle ForeColor="White"></ControlStyle>
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


        

