using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HR_Management_System.Admin.Employee
{
    public partial class DesignationDetils : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewAllDesignation();
            }
            if (!User.IsInRole("Admin"))
            {
                btnAddDesignation.Visible = false;
                
            }
        }

        protected void GrdViewDesignation_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewAllDesignation();
        }

        protected void imgEdit_OnCommand(object sender, CommandEventArgs e)
        {         
            Response.Redirect("~/Admin/Employee/EditDesignation.aspx?id=" + e.CommandArgument);
        }

        protected void btnDelete_OnCommand(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Designation WHERE DesignationID=@designationid", con);
                cmd.Parameters.AddWithValue("@designationid", id);
                int rowCont = cmd.ExecuteNonQuery();

                if (rowCont > 0)
                {
                    Response.RedirectToRoute("DesignationDetails");

                }


            }
        }


        private void ViewAllDesignation()
        {
            if (GrdViewDesignation.Rows.Count < 1)
            {
                GrdViewDesignation.EmptyDataText = "There is no designation to view.";
            }

            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Designation", con);
                con.Open();
                DataTable dt = new DataTable();

                da.Fill(dt);

                GrdViewDesignation.DataSource = dt;
                GrdViewDesignation.DataBind();

            }
        }

        protected void OnClick(object sender, EventArgs e)
        {
            Response.RedirectToRoute("AddDesignation");
        }

        
    }
}