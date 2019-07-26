using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Globalization;

namespace HR_Management_System.Admin.Employee
{
    public partial class EditEmployee : System.Web.UI.Page
    {
        private string _fName = "";
        private string _lName = "";
        private string _email = "";
        private string _dob;
        private string _gender = "";
        private string _designation = "";
        private string _phoneNum = "";
        private string _comment = "";
        private string _image = "";

        private string CS = ConfigurationManager.ConnectionStrings["HRSysDB"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetEmployeeInfo();
            }
        }




        private void GetEmployeeInfo()
        {

            FirstName.Text = "";
            LastName.Value = "";
            EmailAddress.Text = "";
            TelNumber.Text = "";
            DOB.Text = "";
            ddlDesignation.SelectedIndex = -1;
            male.Checked = false;
            female.Checked = false;
            Other.Checked = false;
            imgEmp.ImageUrl = "";

            Comment.Text = "";

            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("SELECT EmpID, EmpFstName, EmpLstName, EmpEmail, Gender, PhnNo, CONVERT(nvarchar(30), DOB, 103) as DOB, Designation, Comment, EmpImage FROM Employees WHERE EmpID=@empid", con);
                cmd.Parameters.AddWithValue("@empid", Request.QueryString["id"]);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                DataTable dt = new DataTable();

                dt.Load(reader);

                foreach (DataRow row in dt.Rows)
                {
                    FirstName.Text = row["EmpFstName"].ToString();
                    LastName.Value = row["EmpLstName"].ToString();
                    EmailAddress.Text = row["EmpEmail"].ToString();
                    TelNumber.Text = row["PhnNo"].ToString();
                    DOB.Text = row["DOB"].ToString();
                    ddlDesignation.SelectedValue = row["Designation"].ToString();

                    if (row["Gender"].ToString() == "Male")
                    {
                        male.Checked = true;
                    }
                    else if (row["Gender"].ToString() == "Female")
                    {
                        female.Checked = true;
                    }
                    else if (row["Gender"].ToString() == "Other")
                    {
                        Other.Checked = true;
                    }
                    else
                    {
                        male.Checked = false;
                        female.Checked = false;
                        Other.Checked = false;
                    }

                    _image = row["EmpImage"].ToString();

                    imgEmp.ImageUrl = "~/Images/" + row["EmpImage"];

                    Comment.Text = row["Comment"].ToString();
                }

            }
        }



        protected void fileUpload()
        {

            if (EmpImage.HasFile)
            {
                _image = Path.GetFileName(DateTime.Now.ToLongTimeString() + EmpImage.FileName);

                string path = Path.Combine(Server.MapPath("~/Images/"), _image); ;

                try
                {
                    EmpImage.SaveAs(path);
                }
                catch
                {
                    throw new Exception();
                }

            }
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {

            _fName = FirstName.Text;
            _lName = LastName.Value;
            _dob = DOB.Text;
            _email = EmailAddress.Text;
            _phoneNum = TelNumber.Text;
            _designation = ddlDesignation.SelectedValue;
            _comment = Comment.Text;

            if (male.Checked)
            {
                _gender = male.Value;
            }
            else if (female.Checked)
            {
                _gender = female.Value;
            }
            else
            {
                _gender = Other.Value;
            }


            if (EmpImage.FileName != "")
            {
                _image = EmpImage.FileName;
            }



            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText =
                    "UPDATE Employees SET EmpFstName = @fname, EmpLstName = @lname, EmpEmail = @email, Gender = @gender, PhnNo = @phoneno, DOB = CONVERT(nvarchar(30), @dob, 103), Designation = @designation, Comment = @comment, EmpImage = @imagepath WHERE EmpID = @empid";

                cmd.Connection = con;

                con.Open();
                cmd.Parameters.AddWithValue("@fname", _fName);
                cmd.Parameters.AddWithValue("@lname", _lName);
                cmd.Parameters.AddWithValue("@email", _email);
                cmd.Parameters.AddWithValue("@gender", _gender);
                cmd.Parameters.AddWithValue("@phoneno", _phoneNum);
                cmd.Parameters.AddWithValue("@dob", DOB.Text);
                cmd.Parameters.AddWithValue("@designation", _designation);
                cmd.Parameters.AddWithValue("@comment", _comment);
                cmd.Parameters.AddWithValue("@imagepath", _image);
                cmd.Parameters.AddWithValue("@empid", Request.QueryString["id"]);
                cmd.ExecuteNonQuery();

                fileUpload();
            }

            Response.RedirectToRoute("EmployeeDetails");
        }

    }
}