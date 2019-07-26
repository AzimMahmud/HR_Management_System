<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="EmployeePayments.aspx.cs" Inherits="HR_Management_System.Admin.Employee.EmployeePayments" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=18.1.1.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       
 <h2 class="header">Employee Details</h2>


        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
            <div class="card">
                <h5 class="card-header">Payment Details</h5>
                <div class="card-body">
                    <button runat="server" id="BtnAddPayment" class="btn-payment float-right btn btn-primary" data-toggle="modal" data-target="#PaymentForm">Add Payment</button>
                    <div class="text-center table-responsive">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            
                            <ContentTemplate>
                                <asp:GridView ID="GrdViewEmployeePayment" CssClass="table table-striped" runat="server" AllowPaging="True" PageSize="5" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PaymentID"  ForeColor="Black" GridLines="Horizontal">
                                    <Columns>
                                       
                                           <asp:TemplateField HeaderText="Employee Name" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Name") %>' runat="server" />
                                                
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        


                                        <asp:TemplateField HeaderText="Salary" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Salary") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Bonus" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("Bonus") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Medical Allownce" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("MedAllowance") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Paying Date" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("PayingDate") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Payment Status"  ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("PaymentStatus") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="For The Month"  ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# Eval("ForTheMonthOf") %>' runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Command" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="BtnEdit" Text="Edit" CausesValidation="False" CssClass="btn btn-sm btn-secondary btn-rounded" OnCommand="BtnEdit_OnCommand" CommandArgument='<%# Eval("PaymentID") %>'></asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="BtnDel" Text="Edit" CausesValidation="False" CssClass="btn btn-sm btn-secondary btn-rounded" OnCommand="BtnDel_OnCommand" CommandArgument='<%# Eval("PaymentID") %>' OnClientClick="return confirm('Are You Sure to Delete?')"></asp:LinkButton>
                                                
                                                
                                      
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
                                 
                            </ContentTemplate>

                        </asp:UpdatePanel>
                       
                    </div>


                </div>
            </div>
        </div>

    
    
   
    

        <%--Modal for Payment form--%>

        <div class="modal fade" id="PaymentForm" tabindex="-1" role="dialog" aria-labelledby="PaymentFormModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Employee Payment</h5>
                        <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </a>
                    </div>
                    <div class="modal-body">
                        <div class="card">
                            <div class="card-body">
                                <div id="PayForm" runat="server" data-parsley-validate="" novalidate="">
                                    <div class="form-group row">
                                        <asp:Label runat="server" AssociatedControlID="ddlEmpName" class="col-12 col-sm-3 col-form-label text-sm-right">Employee Name</asp:Label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <asp:DropDownList ID="ddlEmpName" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <asp:Label runat="server" AssociatedControlID="Salary" class="col-12 col-sm-3 col-form-label text-sm-right">Salary Amount</asp:Label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <asp:TextBox ID="Salary" runat="server" required="" CssClass="form-control" placeholder="Enter your last name"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <asp:Label runat="server" AssociatedControlID="Bonus" class="col-12 col-sm-3 col-form-label text-sm-right">Bonus Amount</asp:Label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <asp:TextBox ID="Bonus" runat="server" TextMode="SingleLine" required="" data-parsley-type="email" CssClass="form-control" placeholder="Enter a valid e-mail"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <asp:Label runat="server" AssociatedControlID="MedicalAllounce" class="col-12 col-sm-3 col-form-label text-sm-right">Medical Allownce</asp:Label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <asp:TextBox ID="MedicalAllounce" runat="server" TextMode="SingleLine" required="" CssClass="form-control" placeholder="Enter a valid phone number"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <asp:Label AssociatedControlID="ddlPayMonth" runat="server" class="col-12 col-sm-3 col-form-label text-sm-right">Month</asp:Label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <asp:DropDownList ID="ddlPayMonth" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="None">Select Month</asp:ListItem>
                                                <asp:ListItem>January</asp:ListItem>
                                                <asp:ListItem>February</asp:ListItem>
                                                <asp:ListItem>March</asp:ListItem>
                                                <asp:ListItem>April</asp:ListItem>
                                                <asp:ListItem>May</asp:ListItem>
                                                <asp:ListItem>June</asp:ListItem>
                                                <asp:ListItem>July</asp:ListItem>
                                                <asp:ListItem>August</asp:ListItem>
                                                <asp:ListItem>September</asp:ListItem>
                                                <asp:ListItem>October</asp:ListItem>
                                                <asp:ListItem>November</asp:ListItem>
                                                <asp:ListItem>December</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlPayMonth" InitialValue="None"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>


                                    <div class="form-group row">
                                        <asp:Label AssociatedControlID="ddlPayStatus" class="col-12 col-sm-3 col-form-label text-sm-right" runat="server">Payment Status</asp:Label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <asp:DropDownList ID="ddlPayStatus" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="Panding">Panding</asp:ListItem>
                                                <asp:ListItem>Paid</asp:ListItem>
                                                <asp:ListItem>Unpaid</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <asp:Label AssociatedControlID="PaymentDate" runat="server" class="col-12 col-sm-3 col-form-label text-sm-right">Payment Date</asp:Label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <asp:TextBox ID="PaymentDate" TextMode="SingleLine" runat="server" placeholder="dd/mm/yyyy" required="" CssClass="form-control"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarPaymentDate"  runat="server" TargetControlID="PaymentDate" Format="dd/MM/yyyy" />
                                       </div>
                                    </div>

                                    <div class="form-group row">
                                        <span class="col-12 col-sm-3"></span>
                                        <div class="col-sm-6">
                                            <div class="custom-checkbox was-validated">
                                                <label class="custom-control custom-checkbox">
                                                    <input type="checkbox" class="custom-control-input is-invalid" data-parsley-errors-container="#error-container2" data-parsley-multiple="group1" id="customControlValidation2" required=""><span class="custom-control-label">Please check this to confirm your information.</span>
                                                </label>

                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="BtnClear" class="btn btn-space btn-secondary" runat="server" Text="Cancel" data-dismiss="modal"></asp:Button>
                        <asp:Button ID="BtnSubmit" class="btn btn-space btn-primary" runat="server" Text="Submit" OnClick="BtnSubmit_Click"></asp:Button>
                    </div>
                </div>
            </div>
        </div>


</asp:Content>


 