using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HR_Management_System.Admin.Employee
{
    public partial class AddDesignation : System.Web.UI.Page
    {
        private string _designationName = "";
        private string _comment = "";
       

        private string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_OnClick(object sender, EventArgs e)
        {
            _designationName = txtDesignationName.Text;
            _comment = txtComment.Text;


            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText =
                    "INSERT INTO Designation(DesignationTitle, Comment) VALUES(@designation,@comment)";


                cmd.Connection = con;

                con.Open();
                cmd.Parameters.AddWithValue("@designation", _designationName);
                cmd.Parameters.AddWithValue("@comment", _comment);
                
                cmd.ExecuteNonQuery();
            }

            Response.RedirectToRoute("DesignationDetails");
        }

        protected void BtnClear_OnClick(object sender, EventArgs e)
        {
            txtDesignationName.Text = "";  
            txtComment.Text = ""; 
        }
    }
}