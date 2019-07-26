using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace HR_Management_System.Admin.Employee
{
    public partial class NewJobAssignment : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadEmployee();
                loadDesignation();


                //Selection Date Start from Jan 2009
                CalendarJoiningDate.StartDate = DateTime.Now.AddYears(-10);
                //Current date can be select but not future date.  
                CalendarJoiningDate.EndDate = DateTime.Now;
            }


        }


        private void loadDesignation()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT DesignationID, DesignationTitle FROM Designation", con);
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);

                ddlDesignation.DataSource = dt;
                ddlDesignation.DataTextField = "DesignationTitle";
                ddlDesignation.DataValueField = "DesignationID";
                ddlDesignation.DataBind();

            }
        }


        private void loadEmployee()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT EmpID, EmpFstName, EmpLstName FROM Employees", con);
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);
                con.Open();

                ddlEmployee.DataSource = dt;
                ddlEmployee.DataTextField = "EmpFstName";
                ddlEmployee.DataValueField = "EmpID";
                ddlEmployee.DataBind();
            }

        }

        protected void BtnSubmit_OnClick(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("proc_JobAssignment", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@jobassignmentid", 1);
                cmd.Parameters.AddWithValue("@designationid", ddlDesignation.SelectedValue);
                cmd.Parameters.AddWithValue("@employeeid", ddlEmployee.SelectedValue);
                cmd.Parameters.AddWithValue("@joiningdate", txtJoiningDate.Text);
                cmd.Parameters.AddWithValue("@joiningsalary", txtJoiningSalary.Text);
                cmd.Parameters.AddWithValue("@leavingdate", txtLeavingDate.Text);
                cmd.Parameters.AddWithValue("@isactive", ddlStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@createdby", Context.User.Identity.GetUserName());
                cmd.Parameters.AddWithValue("@operation", "INSERT");

                int rowCount = cmd.ExecuteNonQuery();

                if (rowCount > 0)
                {
                    Response.RedirectToRoute("JobAssignment");

                }

            }
        }
    }
}