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
    public partial class EditPayments : System.Web.UI.Page
    {

        private string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT EmpID, (EmpFstName + ' '+ EmpLstName) AS Name FROM Employees", con);
                    DataTable dt = new DataTable();
                    dataAdapter.Fill(dt);
                    con.Open();

                    ddlEmpName.DataSource = dt;
                    ddlEmpName.DataTextField = "Name";
                    ddlEmpName.DataValueField = "EmpID";
                    ddlEmpName.DataBind();
                }

                LoadAllData();
            }
        }




        private void LoadAllData()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlDataAdapter dataAdapter = new SqlDataAdapter("SELECT p.*, (e.EmpFstName + e.EmpLstName) as Name FROM Payments as p join Employees AS e on  e.EmpID= p.EmpID", con);
                DataTable dt = new DataTable();
                dataAdapter.Fill(dt);

                ddlEmpName.SelectedValue = dt.Rows[0]["Name"].ToString();
                Salary.Text = dt.Rows[0]["Salary"].ToString();
                Bonus.Text = dt.Rows[0]["Bonus"].ToString();
                MedicalAllounce.Text = dt.Rows[0]["MedAllowance"].ToString();
                
                if (dt.Rows[0]["PaymentStatus"].ToString() == "Paid")
                {
                    ddlPayStatus.SelectedIndex = 1;

                }

                else if (dt.Rows[0]["PaymentStatus"].ToString() == "Unpaid")
                {
                    ddlPayStatus.SelectedIndex = 2;

                }

                else
                {
                    ddlPayStatus.SelectedIndex = 0;

                }

                PaymentDate.Text = dt.Rows[0]["PayingDate"].ToString();
                ddlPayMonth.SelectedValue = dt.Rows[0]["ForTheMonthOf"].ToString();

            }
        }



        protected void BtnSubmit_OnClick(object sender, EventArgs e)
        {

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "proc_EmployeePayment";
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.Parameters.AddWithValue("@paymentid", Request.QueryString["id"]);
                cmd.Parameters.AddWithValue("@salaryamount", Salary.Text);
                cmd.Parameters.AddWithValue("@bonusamount", Bonus.Text);
                cmd.Parameters.AddWithValue("@medicalallowance", MedicalAllounce.Text);
                cmd.Parameters.AddWithValue("@paymentdate", PaymentDate.Text);
                cmd.Parameters.AddWithValue("@paymentstatus", ddlPayStatus.SelectedValue);
                cmd.Parameters.AddWithValue("@month", ddlPayMonth.SelectedValue);
                cmd.Parameters.AddWithValue("@empid", ddlEmpName.SelectedValue);
                cmd.Parameters.AddWithValue("@operation", "UPDATE");

                cmd.ExecuteNonQuery();
            }


            Response.RedirectToRoute("EmployeePayments");
        }

        protected void BtnClear_OnClick(object sender, EventArgs e)
        {
            Response.RedirectToRoute("EmployeePayments");

        }
    }
}