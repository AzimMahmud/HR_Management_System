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
    public partial class EditDesignation : System.Web.UI.Page
    {
        private string _designName ="";
        private string _comment ="";
        
        private string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetDesignationInfo();
            }
        }

        protected void BtnCancel_OnClick(object sender, EventArgs e)
        {
            Response.RedirectToRoute("DesignationDetails");
        }

        protected void BtnUpdate_OnClick(object sender, EventArgs e)
        {
            _designName = txtDesignationName.Text;
            _comment = txtComment.Text;

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText =
                    "UPDATE Designation SET DesignationTitle = @designation, Comment = @comment WHERE DesignationID = @designationid";

                cmd.Connection = con;

                con.Open();
                cmd.Parameters.AddWithValue("@designation", _designName);
                cmd.Parameters.AddWithValue("@comment", _comment);
                cmd.Parameters.AddWithValue("@designationid", Request.QueryString["id"]);
                int countRow = cmd.ExecuteNonQuery();

                if (countRow > 0)
                {
                    Response.RedirectToRoute("DesignationDetails");
                }

            }

        }

        private void GetDesignationInfo()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM Designation WHERE DesignationID=@designationid", con);
                cmd.Parameters.AddWithValue("@designationid", Request.QueryString["id"]);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                DataTable dt = new DataTable();

                dt.Load(reader);

                foreach (DataRow row in dt.Rows)
                {
                   
                   txtDesignationName.Text = row["DesignationTitle"].ToString();
                   txtComment.Text = row["Comment"].ToString();
                }

            }
        }
    }
}