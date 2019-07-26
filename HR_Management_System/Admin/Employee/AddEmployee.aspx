<%@ Page Title="New Employee" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" CodeBehind="AddEmployee.aspx.cs" Inherits="HR_Management_System.Admin.Employee.AddEmployee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <h5 class="card-header">Add Employee</h5>
            <div class="card-body">
                <div id="EmpForm" runat="server" data-parsley-validate="" novalidate="">

                    <div class="form-group row">
                        <asp:Label runat="server" AssociatedControlID="FirstName" class="col-12 col-sm-3 col-form-label text-sm-right">First Name</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="FirstName" runat="server" required="" CssClass="form-control" placeholder="Enter your first name"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label runat="server" AssociatedControlID="LastName" class="col-12 col-sm-3 col-form-label text-sm-right">Last Name</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="LastName" runat="server" required=""  CssClass="form-control" placeholder="Enter your last name"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label runat="server" AssociatedControlID="EmailAddress" class="col-12 col-sm-3 col-form-label text-sm-right">E-Mail</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="EmailAddress" runat="server" TextMode="Email" required="" data-parsley-type="email"  CssClass="form-control" placeholder="Enter a valid e-mail"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label runat="server" AssociatedControlID="TelNumber" class="col-12 col-sm-3 col-form-label text-sm-right">Mobile Number</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="TelNumber" runat="server" TextMode="Phone" required="" CssClass="form-control" placeholder="Enter a valid phone number"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label AssociatedControlID="DOB" runat="server" class="col-12 col-sm-3 col-form-label text-sm-right">Date Of Birth</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="DOB" runat="server" required=""  CssClass="form-control"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarDOB" TargetControlID="DOB"  runat="server" Format="yyyy/MM/dd" />
                        </div>
                    </div>
      
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label text-sm-right">Gender</label>
                        <div class="col-sm-6">
                            <div class="custom-control" >
                                <label class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" runat="server" ID="male" name="Gender" value="Male" class="custom-control-input" /><span class="custom-control-label">Male</span>
                                </label>
                                <label class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" runat="server" ID="female"  name="Gender" class="custom-control-input" value="Female" /><span class="custom-control-label">Female</span>
                                </label>
                                <label class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" runat="server" ID="Other" name="Gender" value="Other" class="custom-control-input" /><span class="custom-control-label">Others</span>
                                </label>
                                
                            </div>
                        </div>
                    </div>

 
                    <div class="form-group row">
                        <asp:Label AssociatedControlID="ddlDesignation" class="col-12 col-sm-3 col-form-label text-sm-right" runat="server">Designation</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control">
                                <asp:ListItem>Select Designation</asp:ListItem>
                                <asp:ListItem>Manager</asp:ListItem>
                                <asp:ListItem>Sr. Executive</asp:ListItem>
                                <asp:ListItem>Executive</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    

                    <div class="form-group row">
                        <asp:Label AssociatedControlID="Comment" class="col-12 col-sm-3 col-form-label text-sm-right" runat="server">Comment</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="Comment" runat="server" TextMode="MultiLine" CssClass="form-control" required=""></asp:TextBox>   
                        </div>
                    </div>


                    <div class="form-group row">
                        <asp:Label class="col-12 col-sm-3 text-sm-right" runat="server">Image Upload</asp:Label>
                        <div class="custom-file custom-control col-12 col-sm-8 col-lg-6">
                            <asp:FileUpload ID="EmpImage" runat="server" CssClass="custom-file-input" />
                            <asp:Label runat="server" class="custom-file-label emp-image" for="EmpImage">Upload Image</asp:Label>
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
