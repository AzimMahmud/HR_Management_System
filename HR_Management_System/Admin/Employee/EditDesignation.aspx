<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" CodeBehind="EditDesignation.aspx.cs" Inherits="HR_Management_System.Admin.Employee.EditDesignation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <h5 class="card-header">Edit Designation</h5>
            <div class="card-body">
                <div id="DesignationForm" runat="server" data-parsley-validate="" novalidate="">

                    <div class="form-group row">
                        <asp:Label runat="server" AssociatedControlID="txtDesignationName" class="col-12 col-sm-3 col-form-label text-sm-right">Title Name</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="txtDesignationName" runat="server" TextMode="SingleLine" required="" CssClass="form-control" placeholder="Enter designation name"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group row">
                        <asp:Label runat="server" AssociatedControlID="txtComment" class="col-12 col-sm-3 col-form-label text-sm-right">Comment</asp:Label>
                        <div class="col-12 col-sm-8 col-lg-6">
                            <asp:TextBox ID="txtComment" runat="server" required=""  TextMode="MultiLine" CssClass="form-control" placeholder="Enter comment about the designation"></asp:TextBox>
                        </div>
                    </div>


                    <div class="form-group row text-right">
                        <div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
                            <asp:Button ID="BtnUpdate" class="btn btn-space btn-primary" runat="server" Text="Update" OnClick="BtnUpdate_OnClick"></asp:Button>
                            <asp:Button ID="BtnCancel" class="btn btn-space btn-secondary" runat="server" Text="Cancel" OnClick="BtnCancel_OnClick"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
