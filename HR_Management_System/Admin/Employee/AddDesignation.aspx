<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" CodeBehind="AddDesignation.aspx.cs" Inherits="HR_Management_System.Admin.Employee.AddDesignation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <h5 class="card-header">Add Designation</h5>
            <div class="card-body">
                <div id="DesignationForm" runat="server" data-parsley-validate="" novalidate="">

                    <div class="form-group row">
                        <asp:Label runat="server" AssociatedControlID="txtDesignationName" class="col-12 col-sm-3 col-form-label text-sm-right">First Name</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="txtDesignationName" runat="server" required="" CssClass="form-control" placeholder="Enter designation name"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label runat="server" AssociatedControlID="txtComment" class="col-12 col-sm-3 col-form-label text-sm-right">Last Name</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="txtComment" runat="server" required=""  TextMode="MultiLine" CssClass="form-control" placeholder="Enter comment about the designation"></asp:TextBox>
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
