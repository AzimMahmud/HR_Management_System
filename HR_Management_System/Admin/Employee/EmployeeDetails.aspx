<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="EmployeeDetails.aspx.cs"  Inherits="HR_Management_System.Admin.EmployeeDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    

    <h2 class="header">Employee Details</h2>

    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <h5 class="card-header">Employee Details</h5>
            <div class="card-body">
                <div class="text-center table-responsive">
                    <asp:GridView ID="GrdViewEmployee" OnRowDeleting="GrdViewEmployee_RowDeleting" CssClass="table table-striped" runat="server" AllowPaging="True" PageSize="5" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EmpID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">

                        <Columns>

                            <asp:TemplateField HeaderText="Full Name" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <span><%# Eval("EmpFstName") %> <%# Eval("EmpLstName") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("EmpEmail") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Gender") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Phone No" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("PhnNo") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Date of Birth" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("DOB") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Designation" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Label Text='<%# Eval("Designation") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField runat="server" HeaderText="Image" HeaderStyle-ForeColor="White">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" Width="100px" Height="100px" ImageUrl='<%# "~/Images/" + Eval("EmpImage") %>' />
                                </ItemTemplate>

                                <ControlStyle ForeColor="White"></ControlStyle>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Command" HeaderStyle-ForeColor="White">
                                <ItemTemplate>

                                    <asp:LoginView runat="server">
                                        <RoleGroups>
                                            <asp:RoleGroup Roles="Admin">
                                                <ContentTemplate>
                                                    <asp:ImageButton runat="server" ID="imgEdit" CausesValidation="false" OnCommand="imgEdit_Command" ImageUrl="~/Content/icons/edit_icon.svg" CommandArgument='<%# Eval("EmpID") %>' />
                                                    <asp:ImageButton runat="server" ID="imgDelete" CausesValidation="false" OnCommand="imgDelete_OnCommand" ImageUrl="~/Content/icons/delete_icon.svg" CommandArgument='<%# Eval("EmpID") %>' />

                                                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" Enabled="True" DisplayModalPopupID="ModalPopupExtenderConfirmDelete" runat="server" TargetControlID="imgDelete" />
                                                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtenderConfirmDelete"
                                                        PopupControlID="pnlPopup"
                                                        TargetControlID="imgDelete"
                                                        OkControlID="btnYes"
                                                        CancelControlID="btnNo"
                                                        runat="server">
                                                    </ajaxToolkit:ModalPopupExtender>
                                                    <asp:Panel ID="pnlPopup" runat="server" CssClass="modalPopup" Style="display: none">
                                                        <div class="header">
                                                            Confirmation
                                                        </div>
                                                        <div class="body">
                                                            Do you want to delete this record?
                                                        </div>
                                                        <div class="footer" align="right">
                                                            <asp:Button ID="btnYes" runat="server" Text="Yes" />
                                                            <asp:Button ID="btnNo" runat="server" Text="No" />
                                                        </div>
                                                    </asp:Panel>
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
