<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" CodeBehind="UserRoles.aspx.cs" Inherits="HR_Management_System.Admin.User.AddRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div class="row ">
            <div class="col-sm-12">
                <h2>Roles List</h2>
                <asp:GridView ID="grdRoles" runat="server" DataKeyNames="Id" AutoGenerateColumns="False" SelectMethod="grdRoles_GetData" CssClass="table table-bordered  mb-5" OnPreRender="grdRoles_PreRender" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="Gray" />
                    <Columns>
                        <asp:BoundField HeaderText="Role Name" DataField="Name" />
                        <asp:CommandField ShowSelectButton="true" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="White" HorizontalAlign="Center" BackColor="#666666" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>

                 <asp:DetailsView ID="dvRoles" runat="server" DataKeyNames="Id" AutoGenerateRows="False" CssClass="table table-bordered table-striped table-condensed" SelectMethod="dvRoles_GetItem" UpdateMethod="dvRoles_UpdateItem" InsertMethod="dvRoles_InsertItem" DeleteMethod="dvRoles_DeleteItem" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                     <AlternatingRowStyle BackColor="#F7F7F7" />
                     <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <Fields>
                    <asp:BoundField HeaderText="Role Name" DataField="Name" />
                    <asp:CommandField ShowEditButton="true" ShowInsertButton="true" ShowDeleteButton="true" />
                </Fields>
                     <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                     <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                     <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                     <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            </asp:DetailsView>
            </div>
        </div>

</asp:Content>
