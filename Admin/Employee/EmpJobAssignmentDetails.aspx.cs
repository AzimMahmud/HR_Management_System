using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace HR_Management_System.Admin.Employee
{
    public partial class EmpJobAssignmentDetails : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewAllEmployeeJobDetails();
            }

        }

        private void ViewAllEmployeeJobDetails()
        {
            if (GrdViewEmployeeJobDetails.Rows.Count < 1)
            {
                GrdViewEmployeeJobDetails.EmptyDataText = "There is no employee job info to view.";
            }

            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM vw_JobAssignDetails", con);
                con.Open();
                DataTable dt = new DataTable();

                da.Fill(dt);

                GrdViewEmployeeJobDetails.DataSource = dt;
                GrdViewEmployeeJobDetails.DataBind();

            }
        }

        protected void imgEdit_Command(object sender, CommandEventArgs e)
        {
            ImageButton btn = sender as ImageButton;
            string id = btn.CommandArgument.ToString();

            Response.Redirect("~/Admin/Employee/EditJobAssignment.aspx?id=" + id);
        }

        protected void imgDelete_OnCommand(object sender, CommandEventArgs e)
        {
            ImageButton btn = sender as ImageButton;
            string id = btn.CommandArgument.ToString();

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("proc_JobAssignment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@jobassignmentid", id);
                cmd.Parameters.AddWithValue("@designationid", "");
                cmd.Parameters.AddWithValue("@employeeid", "");
                cmd.Parameters.AddWithValue("@joiningdate", "");
                cmd.Parameters.AddWithValue("@joiningsalary", "");
                cmd.Parameters.AddWithValue("@leavingdate", "");
                cmd.Parameters.AddWithValue("@isactive", "");
                cmd.Parameters.AddWithValue("@createdby", "");
                cmd.Parameters.AddWithValue("@operation", "DELETE");
                int rowCont = cmd.ExecuteNonQuery();

                if (rowCont > 0)
                {
                    Response.RedirectToRoute("JobAssignment");

                }


            }
        }


        protected void GrdViewEmployeeJobDetails_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewAllEmployeeJobDetails();
        }


       
    }
}