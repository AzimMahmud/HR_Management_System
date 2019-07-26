<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" CodeBehind="AssignRole.aspx.cs" Inherits="HR_Management_System.Admin.User.AssignRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


        <div class="container">
        <h1>Role Management</h1>
        <div class="row">
            <div class="col-sm-12 table-responsive mb-5">
                <h2>Users List</h2>
                <asp:GridView ID="grdUsers" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" SelectMethod="grdUsers_GetData" ItemType="HR_Management_System.Models.ApplicationUser" CssClass="table table-bordered table-striped table-condensed" OnPreRender="grdUsers_PreRender" CellPadding="4" ForeColor="black" GridLines="None">
                    <AlternatingRowStyle BackColor="gray" />
                    <Columns>
                        <asp:BoundField HeaderText="User Name" DataField="UserName"  ItemStyle-ForeColor="White" >
<ItemStyle ForeColor="black"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Email" DataField="Email" ItemStyle-ForeColor="White" >
<ItemStyle ForeColor="black"></ItemStyle>
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Roles" ItemStyle-ForeColor="White">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# ListRoles(Item.Roles) %>'></asp:Label>
                            </ItemTemplate>

<ItemStyle ForeColor="black"></ItemStyle>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="true" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="black" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="black" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </div>

            
        </div>
        
            <div class="col-sm-6">
                <h2>Add Roles to User</h2>
                <div class="form-group">
                    <label class="control-lable">Select User : </label>
                    <asp:DropDownList ID="ddlUser" runat="server" SelectMethod="grdUsers_GetData" DataValueField="Id" DataTextField="UserName" CssClass="form-control">
                    
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="control-label">Add One or More Roles : </label>
                    <asp:ListBox ID="lstRoles" runat="server" SelectionMode="Multiple" SelectMethod="grdRoles_GetData" DataValueField="Id" DataTextField="Name" CssClass="form-control">

                    </asp:ListBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="btnAddRoles" runat="server" Text="Add Roles" CssClass="btn btn-default" OnClick="btnAddRoles_OnClick" />
                </div>
            </div>
        </div>
        

    
</asp:Content>
