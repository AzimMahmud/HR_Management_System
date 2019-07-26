using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace HR_Management_System.Admin.Employee
{
    public partial class EmployeePayments : System.Web.UI.Page
    {

        string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("Admin"))
            {
                BtnAddPayment.Visible = false;
            }

            if (!IsPostBack)
            {
                LoadAllDataToGrid();
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT EmpID, (EmpFstName + ' '+ EmpLstName) as Name FROM Employees", con);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    con.Open();
               
                    ddlEmpName.DataSource = dt;
                    ddlEmpName.DataTextField = "Name";
                    ddlEmpName.DataValueField = "EmpID";
                    ddlEmpName.DataBind();
                }

            }


        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "proc_EmployeePayment";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@paymentid", "");
                cmd.Parameters.AddWithValue("@salaryamount", Salary.Text);
                cmd.Parameters.AddWithValue("@bonusamount", Bonus.Text);
                cmd.Parameters.AddWithValue("@medicalallowance", MedicalAllounce.Text);
                cmd.Parameters.AddWithValue("@paymentdate", PaymentDate.Text );
                cmd.Parameters.AddWithValue("@paymentstatus", ddlPayStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@month", ddlPayMonth.SelectedValue);
                cmd.Parameters.AddWithValue("@empid", ddlEmpName.SelectedValue);
                cmd.Parameters.AddWithValue("@operation", "INSERT");

                cmd.ExecuteNonQuery();
            }


            Response.RedirectToRoute("EmployeePayments");

        }


       

        private void LoadAllDataToGrid()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT p.*, (e.EmpFstName +' ' + e.EmpLstName) as Name FROM Payments as p join Employees AS e on  e.EmpID= p.EmpID", con);
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);

                GrdViewEmployeePayment.DataSource = dt;
                GrdViewEmployeePayment.DataBind();

            }
        }

    
       

      


        protected void BtnEdit_OnCommand(object sender, CommandEventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string id = btn.CommandArgument;
            Response.Redirect("~/Admin/Employee/EditPayments.aspx?id=" + id);
        }


      
        protected void BtnDel_OnCommand(object sender, CommandEventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string id = btn.CommandArgument;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "proc_EmployeePayment";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@paymentid", id);
                cmd.Parameters.AddWithValue("@salaryamount", String.Empty);
                cmd.Parameters.AddWithValue("@bonusamount", String.Empty);
                cmd.Parameters.AddWithValue("@medicalallowance", String.Empty);
                cmd.Parameters.AddWithValue("@paymentdate", String.Empty);
                cmd.Parameters.AddWithValue("@paymentstatus", String.Empty);
                cmd.Parameters.AddWithValue("@month", String.Empty);
                cmd.Parameters.AddWithValue("@empid", String.Empty);
                cmd.Parameters.AddWithValue("@operation", "DELETE");

                int rowCont = cmd.ExecuteNonQuery();
                if (rowCont > 0)
                {
                    Response.RedirectToRoute("EmployeePayments");


                }


            }
        }
    }
}