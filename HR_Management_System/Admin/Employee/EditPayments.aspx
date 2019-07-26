<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" CodeBehind="EditPayments.aspx.cs" Inherits="HR_Management_System.Admin.Employee.EditPayments" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=18.1.1.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <h5 class="card-header">Add Employee</h5>
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


                    <div class="form-group row text-right">
                        <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                            <asp:Button ID="BtnSubmit" class="btn btn-space btn-primary" runat="server" Text="Submit" OnClick="BtnSubmit_OnClick"></asp:Button>
                            <asp:Button ID="BtnClear" class="btn btn-space btn-secondary" runat="server" Text="Cancel" OnClick="BtnClear_OnClick"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
