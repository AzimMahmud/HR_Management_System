using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HR_Management_System.Admin.Department
{
    public partial class DepartmentDetails : System.Web.UI.Page
    {
        string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewAllDepartment();
            }

            if (!User.IsInRole("Admin"))
            {
                txtDepartmentName.Visible = false;
                btnSubmit.Visible = false;
                lblDepartName.Visible = false;
            }
        }

        protected void GrdViewDepartment_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            ViewAllDepartment(); 
        }

        protected void imgEdit_OnCommand(object sender, CommandEventArgs e)
        {
            

            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT *  FROM Department WHERE DepartmentID=@departmentid", con);
                cmd.Parameters.AddWithValue("@departmentid", e.CommandArgument);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                da.Fill(dt);

                txtDepartmentName.Text = dt.Rows[0]["DepartmentName"].ToString();

                btnSubmit.Text = "Update";
                lblDepartName.InnerHtml = "Edit Department";

                ViewState.Add("id", e.CommandArgument);


            }
        }

        protected void btnDelete_OnCommand(object sender, CommandEventArgs e)
        {
            string id = e.CommandArgument.ToString();



            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Department WHERE DepartmentID=@departmentid", con);
                cmd.Parameters.AddWithValue("@departmentid", id);
                int rowCont = cmd.ExecuteNonQuery();

                if (rowCont > 0)
                {
                    Response.RedirectToRoute("DepartmentDetails");

                }


            }
        }

        private void ViewAllDepartment()
        {
            if (GrdViewDepartment.Rows.Count < 1)
            {
                GrdViewDepartment.EmptyDataText = "There is no Department to view.";
            }

            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Department", con);
                con.Open();
                DataTable dt = new DataTable();

                da.Fill(dt);

                GrdViewDepartment.DataSource = dt;
                GrdViewDepartment.DataBind();

            }
        }

        private void ClearControls()
        { 
            btnSubmit.Text = "Save";
            txtDepartmentName.Text = "";
            lblDepartName.InnerHtml = "Add Department";
        }


        protected void UpdateDepartmentDetails()
        {
            if (txtDepartmentName.Text != "")
            {
                using (SqlConnection con = new SqlConnection(CS))
                {

                    SqlCommand cmd = new SqlCommand("UPDATE Department SET DepartmentName = @name WHERE DepartmentID = @id", con);
                    cmd.Parameters.AddWithValue("@name", txtDepartmentName.Text);
                    cmd.Parameters.AddWithValue("@id", ViewState["id"]);
                    con.Open();

                    int rowCount = cmd.ExecuteNonQuery();

                    if (rowCount > 0)
                    {
                        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Department", con);
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        GrdViewDepartment.DataSource = dt;
                        GrdViewDepartment.DataBind();
                    }

                }

                ClearControls();
            }
            Response.RedirectToRoute("DepartmentDetails");
        }


       

        protected void btnSubmit_OnClick(object sender, EventArgs e)
        {


            if (btnSubmit.Text == "Update")
            {
                UpdateDepartmentDetails();
            }
            else
            {
                SaveDepartmentDetails();
            }



            
        }


        protected void SaveDepartmentDetails()
        {
            if (txtDepartmentName.Text != "")
            {
                using (SqlConnection con = new SqlConnection(CS))
                {

                    SqlCommand cmd = new SqlCommand("INSERT INTO Department (DepartmentName) VALUES(@name)", con);
                    cmd.Parameters.AddWithValue("@name", txtDepartmentName.Text);
                    con.Open();

                    int rowCount = cmd.ExecuteNonQuery();

                    if (rowCount > 0)
                    {
                        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Department", con);
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        GrdViewDepartment.DataSource = dt;
                        GrdViewDepartment.DataBind();
                    }

                }
            }
        }
    }
}