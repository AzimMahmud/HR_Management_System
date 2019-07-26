using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Net.Mail;


namespace HR_Management_System.Admin.Employee
{
    public partial class AddEmployee : System.Web.UI.Page
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
          
        }

        protected void BtnClear_OnClick(object sender, EventArgs e)
        {

            FirstName.Text = "";
            LastName.Text = "";
            DOB.Text = "";
            EmailAddress.Text = "";
            TelNumber.Text = "";
            ddlDesignation.SelectedIndex = -1;
            Comment.Text = "";

            if (male.Checked)
            {
                male.Checked = false;
            }
            else if (female.Checked)
            {
                female.Checked = false;
            }
            else
            {
                Other.Checked = false;
            }
        }

        protected void BtnSubmit_OnClick(object sender, EventArgs e)
        {
            _fName = FirstName.Text;
            _lName = LastName.Text;
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


            fileUpload();

            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand();
                cmd.CommandText =
                    "INSERT INTO Employees(EmpFstName, EmpLstName, EmpEmail, Gender, PhnNo, DOB, " +
                    "Designation, Comment, EmpImage) VALUES(@fname,@lname,@email,@gender,@phoneno, " +
                    "CONVERT(nvarchar(30), @dob, 103),@designation,@comment,@imagepath)";


                cmd.Connection = con;

                con.Open();
                cmd.Parameters.AddWithValue("@fname", _fName);
                cmd.Parameters.AddWithValue("@lname", _lName);
                cmd.Parameters.AddWithValue("@email", _email);
                cmd.Parameters.AddWithValue("@gender", _gender);
                cmd.Parameters.AddWithValue("@phoneno", _phoneNum);
                cmd.Parameters.AddWithValue("@dob", _dob);
                cmd.Parameters.AddWithValue("@designation", _designation);
                cmd.Parameters.AddWithValue("@comment", _comment);
                cmd.Parameters.AddWithValue("@imagepath", _image);
                cmd.ExecuteNonQuery();



                // Send Email After Successfully 
                sendEmailToClient();
                sendEmailToAuthority();

            }

            FirstName.Text = "";
            LastName.Text = "";
            DOB.Text = "";
            EmailAddress.Text = "";
            TelNumber.Text = "";
            ddlDesignation.SelectedIndex = -1;
            Comment.Text = "";

            if (male.Checked)
            {
                male.Checked = false;
            }
            else if (female.Checked)
            {
                female.Checked = false;
            }
            else
            {
                Other.Checked = false;
            }
        }

        protected void fileUpload()
        {

            if (EmpImage.HasFile)
            {
                _image = Path.GetFileName(EmpImage.FileName);

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


        protected void sendEmailToClient()
        {
            var toAddress = _email;  // where the email will be sending
            string subject = "New Employee Registration";
            string body = "Thank you " + _fName + " " + _lName + ". ";
            MailMessage mailMessage = new MailMessage("noakhaliisreal@gmail.com", toAddress);
            mailMessage.Body = body;
            mailMessage.Subject = subject;
            // smtp settings
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Send(mailMessage);
        }

        protected void sendEmailToAuthority()
        {
            
            string subject = "New Employee Registration";
            string body = _fName + " " + _lName + " is registered as a new employee.\n";
            body += "His/her personal information is like as below-\n";
            body += "Full Name : " + _fName + " " + LastName.Text + "\n";
            body += "Email Address : " + _email + "\n";
            body += "Phone Number : " + _phoneNum + "\n";
            body += "Designation : " + _designation + "\n";
            body += "Comment : " + _comment;
            

            MailMessage mailMessage = new MailMessage("noakhaliisreal@gmail.com", "noakhaliisreal@gmail.com");
            mailMessage.Body = body;
            mailMessage.Subject = subject;
            // smtp settings
            SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
            smtp.Send(mailMessage);

        }




    }
}