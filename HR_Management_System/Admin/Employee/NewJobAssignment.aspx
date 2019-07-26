<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" CodeBehind="NewJobAssignment.aspx.cs" Inherits="HR_Management_System.Admin.Employee.NewJobAssignment" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=18.1.1.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <h5 class="card-header">Assign Job To Employee</h5>
            <div class="card-body">
                <div id="EmpJobAssingmentForm" runat="server" data-parsley-validate="" novalidate="">

                    <div class="form-group row">
                        <asp:Label AssociatedControlID="ddlEmployee" class="col-12 col-sm-3 col-form-label text-sm-right" runat="server">Employee Name</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control">   
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label AssociatedControlID="ddlDesignation" class="col-12 col-sm-3 col-form-label text-sm-right" runat="server">Designation</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control">   
                            </asp:DropDownList>
                        </div>
                    </div>


                    <div class="form-group row">
                        <asp:Label AssociatedControlID="txtJoiningDate" runat="server" class="col-12 col-sm-3 col-form-label text-sm-right">Joining Date</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="txtJoiningDate" runat="server" placeholder="mm/dd/yyyy" required=""  CssClass="form-control"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarJoiningDate"  runat="server" TargetControlID="txtJoiningDate" Format="dd/MM/yyyy" />
                        
                        </div>
                    </div>
                    
                    <div class="form-group row">
                        <asp:Label AssociatedControlID="txtJoiningSalary" runat="server" class="col-12 col-sm-3 col-form-label text-sm-right">Joining Salary</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="txtJoiningSalary" runat="server" required="" placeholder="Joining Salary" TextMode="SingleLine" CssClass="form-control"></asp:TextBox>

                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label AssociatedControlID="txtLeavingDate" runat="server" class="col-12 col-sm-3 col-form-label text-sm-right">Leaving Date</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="txtLeavingDate" runat="server" placeholder="mm/dd/yyyy" CssClass="form-control"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarLeavingDate"  runat="server" TargetControlID="txtLeavingDate" Format="dd/MM/yyyy" />
                            </div>
                    </div>

 
                    <div class="form-group row">
                        <asp:Label AssociatedControlID="ddlStatus" class="col-12 col-sm-3 col-form-label text-sm-right" runat="server">Status</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                <asp:ListItem>Select Designation</asp:ListItem>
                                <asp:ListItem Value="1">Active</asp:ListItem>
                                <asp:ListItem Value="0">InActive</asp:ListItem>
                            </asp:DropDownList>
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
                            <asp:Button ID="BtnClear" class="btn btn-space btn-secondary" runat="server" Text="Cancel" ></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
