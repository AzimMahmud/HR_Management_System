using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// Add
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System.Web.ModelBinding;
using HR_Management_System.Models;

namespace HR_Management_System.Admin.User
{
    public partial class AssignRole : System.Web.UI.Page
    {
        ApplicationRoleManager _roleMgr;
        ApplicationUserManager _userMgr;
        protected void Page_Load(object sender, EventArgs e)
        {
            _userMgr = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            _roleMgr = Context.GetOwinContext().Get<ApplicationRoleManager>();

        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<ApplicationUser> grdUsers_GetData()
        {
            return _userMgr.Users;
        }



        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public object dvUsers_GetItem([Control] string grdUsers)
        {
            if (grdUsers == null) return new ApplicationUser();
            return (from u in _userMgr.Users where u.Id == grdUsers select u).SingleOrDefault();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void dvUsers_UpdateItem(string Id)
        {
            ApplicationUser user = (from u in _userMgr.Users
                                    where u.Id == Id
                                    select u).SingleOrDefault();
            TryUpdateModel(user);
            user.UserName = user.Email; // assign email to username
            IdentityResult result = _userMgr.Update(user);
            if (result.Succeeded) Reload();
        }

        public void dvUsers_InsertItem()
        {
            ApplicationUser user = new ApplicationUser();
            TryUpdateModel(user);
            user.UserName = user.Email; // assign email to username
            IdentityResult result = _userMgr.Create(user);
            if (result.Succeeded) Reload();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void dvUsers_DeleteItem(string Id)
        {
            ApplicationUser user = (from u in _userMgr.Users
                                    where u.Id == Id
                                    select u).SingleOrDefault();
            IdentityResult result = _userMgr.Delete(user);
            if (result.Succeeded) Reload();
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<IdentityRole> grdRoles_GetData()
        {
            return _roleMgr.Roles;
        }





        private void Reload()
        {
            grdUsers.DataBind();
            ddlUser.DataBind();
            lstRoles.DataBind();
        }


        // Helper Method
        public string ListRoles(ICollection<IdentityUserRole> userRoles)
        {
            IdentityRole _role;
            var names = new List<string>();

            foreach (var ur in userRoles)
            {
                _role = (from r in _roleMgr.Roles
                         where r.Id == ur.RoleId
                         select r).SingleOrDefault();
                names.Add(_role.Name);
            }
            return string.Join(", ", names);
        }

        protected void btnAddRoles_OnClick(object sender, EventArgs e)
        {
            string userID = ddlUser.SelectedValue;
            foreach (ListItem item in lstRoles.Items)
            {
                // if role is selected and user is not in it, add user to role
                if (item.Selected)
                {
                    if (!_userMgr.IsInRole(userID, item.Text))
                    {
                        _userMgr.AddToRole(userID, item.Text);
                    }
                }
                // if role is not selected and user is in it, remove user from role
                else
                {
                    if (_userMgr.IsInRole(userID, item.Text))
                    {
                        _userMgr.RemoveFromRole(userID, item.Text);
                    }
                }
            }

            grdUsers.DataBind();
        }

        protected void grdUsers_PreRender(object sender, EventArgs e)
        {
            GridView grd = (GridView)sender;
            if (grd.HeaderRow != null)
                grd.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
  

    }
}