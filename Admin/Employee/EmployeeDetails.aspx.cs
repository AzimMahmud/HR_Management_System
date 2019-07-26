using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;


namespace HR_Management_System.Admin
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        private string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewAllEmployee();
            }

        }


        private void ViewAllEmployee()
        {
            if (GrdViewEmployee.Rows.Count < 1)
            {
                GrdViewEmployee.EmptyDataText = "There is no Employee to view.";
            }
            
            using (SqlConnection con = new SqlConnection(CS))
            {
                
                SqlDataAdapter da = new SqlDataAdapter("SELECT EmpID, EmpFstName, EmpLstName, EmpEmail, Gender, PhnNo, CONVERT(nvarchar(30), DOB, 103) as DOB, Designation, Comment, EmpImage FROM Employees", con);
                con.Open();
                DataTable dt = new DataTable();

                da.Fill(dt);

                GrdViewEmployee.DataSource = dt;
                GrdViewEmployee.DataBind();  

            }
        }
        


        protected void imgEdit_Command(object sender, CommandEventArgs e)
        {
            ImageButton btn = sender as ImageButton;
            string id = btn.CommandArgument.ToString();

            Response.Redirect("~/Admin/Employee/EditEmployee.aspx?id=" + id);
        }

        protected void GrdViewEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewAllEmployee();
        }

       

       

        protected void imgDelete_OnCommand(object sender, CommandEventArgs e)
        {
            ImageButton btn = sender as ImageButton;
            string id = btn.CommandArgument.ToString();

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Employees WHERE EmpID=@empid", con);
                cmd.Parameters.AddWithValue("@empid", id);
                int rowCont = cmd.ExecuteNonQuery();

                if (rowCont > 0)
                {
                    Response.RedirectToRoute("EmployeeDetails");

                }


            }
        }
    }
}