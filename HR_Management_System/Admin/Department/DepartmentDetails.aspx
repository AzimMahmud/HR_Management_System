<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminArea.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="DepartmentDetails.aspx.cs" Inherits="HR_Management_System.Admin.Department.DepartmentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    

    <h2 class="header">Employee Details</h2>

    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
        <div class="card">
            <h5 class="card-header">Employee Details</h5>
            <div class="card-body">
                <div class="">
                  
                                    <div class="col-lg-12 form-group align-content-center float-right mb-5">
                                        <label runat="server" ID="lblDepartName" class="float-left col-md-4 text-lg-right align-content-center txtInputLabel">Add Department : </label>
                                        <asp:TextBox ID="txtDepartmentName" runat="server" placeholder="Enter Department Name...." CssClass="float-left align-content-center col-md-4 form-control txtInputFontSize"></asp:TextBox>
                                        <asp:Button ID="btnSubmit" runat="server" CssClass="form-control ml-3 col-md-3 align-content-center btn btn-secondary float-right" Text="Save" OnClick="btnSubmit_OnClick" />
                                    </div>
                                                        
                               
                  
               
                </div>
                     <div class="text-center table-responsive">

                         
                         
                        
                                <asp:GridView  ID="GrdViewDepartment" OnRowDeleting="GrdViewDepartment_OnRowDeleting" CssClass="table table-striped" runat="server" AllowPaging="True" PageSize="5" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DepartmentID" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                
                                    <Columns>

                                        <asp:TemplateField HeaderText="ID" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label ID="DepartmentID" runat="server" Text='<%# Eval("DepartmentID") %>'></asp:Label>                                                
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Department Name" ItemStyle-ForeColor="Black" HeaderStyle-ForeColor="White">
                                            <ItemTemplate>
                                                <asp:Label ID="DepartmentName" runat="server" Text='<%# Eval("DepartmentName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                               <asp:TemplateField HeaderText="Command" HeaderStyle-ForeColor="White">
                                        <ItemTemplate>
                                        
                                            <asp:LoginView runat="server">
                                                <RoleGroups>
                                                    <asp:RoleGroup Roles="Admin">
                                                        <ContentTemplate>
                                                            <asp:ImageButton runat="server" ID="imgEdit" CausesValidation="false" OnCommand="imgEdit_OnCommand" ImageUrl="~/Content/icons/edit_icon.svg" CommandArgument='<%# Eval("DepartmentID") %>' />
                                                            <asp:ImageButton ID="btnDelete" runat="server" CausesValidation="false" OnCommand="btnDelete_OnCommand" CommandName="Delete" Text="Delete" ImageUrl="~/Content/icons/delete_icon.svg" CommandArgument='<%# Eval("DepartmentID") %>' OnClientClick="return confirm('Are you sure to delete?')" />

                                                          

                                                        
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
    
      <%--  <%-- Add Department --%>
       <%--<div class="modal fade" id="AddDipartmentForm" tabindex="-1" role="dialog" aria-labelledby="AddDipartmentModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Department</h5>
                        <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </a>
                    </div>
                    <div class="modal-body">
                        <div class="card">
                            <div class="card-body">
                                <div id="AddDipartmentForm" runat="server" data-parsley-validate="" novalidate="">
                                    
                                    <div class="form-group row">
                                        <asp:Label ID="lblDepartmentName" AssociatedControlID="DepartmentName" runat="server" class="col-12 col-sm-3 col-form-label text-sm-right">Month</asp:Label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <asp:TextBox ID="DepartmentName" runat="server" TextMode="SingleLine" required="" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="BtnClear" class="btn btn-space btn-secondary" runat="server" Text="Cancel" data-dismiss="modal"></asp:Button>
                        <asp:Button ID="BtnSubmit" class="btn btn-space btn-primary" runat="server" Text="Submit" OnClick="BtnSubmit_OnClick"></asp:Button>
                    </div>
                </div>
            </div>
        </div> 
        --%>
        <%-- Edit Department --%>
       <%--<div class="modal fade" id="EditDipartmentForm" tabindex="-1" role="dialog" aria-labelledby="EditDipartmentModal" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Department</h5>
                        <a href="#" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </a>
                    </div>
                    <div class="modal-body">
                        <div class="card">
                            <div class="card-body">
                                <div id="EditDipartment" runat="server" data-parsley-validate="" novalidate="">
                                    
                                    <div class="form-group row">
                                        <asp:Label ID="lblDepartmentNameEdit" AssociatedControlID="txtDepartmentName" runat="server" class="col-12 col-sm-3 col-form-label text-sm-right">Month</asp:Label>
                                        <div class="col-12 col-sm-8 col-lg-6">
                                            <asp:TextBox ID="" runat="server" TextMode="SingleLine" required="" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button class="btn btn-space btn-secondary" runat="server" Text="Cancel" data-dismiss="modal"></asp:Button>
                        <asp:Button ID="" class="btn btn-space btn-primary" runat="server" Text="Submit" OnClick="btnEditDepartment_OnClick"></asp:Button>
                    </div>
                </div>
            </div>
        </div> --%>
        


    
    
    
    
    
    
    

</asp:Content>
