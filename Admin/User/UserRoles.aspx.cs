using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace HR_Management_System.Admin.User
{
    public partial class AddRole : System.Web.UI.Page
    {
        ApplicationRoleManager _roleMgr;
        protected void Page_Load(object sender, EventArgs e)
        {
            _roleMgr = Context.GetOwinContext().Get<ApplicationRoleManager>();

        }


       

        public IQueryable<IdentityRole> grdRoles_GetData()
        {
            return _roleMgr.Roles;
        }



        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public object dvRoles_GetItem([Control] string grdRoles)
        {
            if (grdRoles == null) return new IdentityRole();
            return (from r in _roleMgr.Roles where r.Id == grdRoles select r).SingleOrDefault();
        }

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

        protected void grdRoles_PreRender(object sender, EventArgs e)
        {
            GridView grd = (GridView)sender;
            if (grd.HeaderRow != null)
                grd.HeaderRow.TableSection = TableRowSection.TableHeader;
        }



        // The id parameter name should match the DataKeyNames value set on the control
        public void dvRoles_UpdateItem(string Id)
        {
            IdentityRole role = (from r in _roleMgr.Roles
                where r.Id == Id
                select r).SingleOrDefault();
            TryUpdateModel(role);
            IdentityResult result = _roleMgr.Update(role);
            if (result.Succeeded) Reload();
        }

        public void dvRoles_InsertItem()
        {
            IdentityRole role = new IdentityRole();
            TryUpdateModel(role);
            IdentityResult result = _roleMgr.Create(role);
            if (result.Succeeded) Reload();
        }

        // The id parameter name should match the DataKeyNames value set on the control
        public void dvRoles_DeleteItem(string Id)
        {
            IdentityRole role = (from r in _roleMgr.Roles
                where r.Id == Id
                select r).SingleOrDefault();
            IdentityResult result = _roleMgr.Delete(role);
            if (result.Succeeded) Reload();

        }

        private void Reload()
        {
            grdRoles.DataBind();
            
        }
    }
}