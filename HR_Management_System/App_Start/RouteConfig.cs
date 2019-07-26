using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace HR_Management_System
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings);
            routes.MapPageRoute(
               "AddEmployee",
               "Employee/New",
               "~/Admin/Employee/AddEmployee.aspx");
            routes.MapPageRoute(
               "EmployeeDetails",
               "Employee/Details",
               "~/Admin/Employee/EmployeeDetails.aspx");
            routes.MapPageRoute(
                "EditEmployee",
                "Employee/Edit/{id}",
                "~/Admin/Employee/AddEmployee.aspx");

            routes.MapPageRoute(
               "EmployeePayments",
               "Employee/Payments/Details",
               "~/Admin/Employee/EmployeePayments.aspx");
            routes.MapPageRoute(
                "DesignationDetails",
                "Designation/Details",
                "~/Admin/Employee/DesignationDetails.aspx");
            routes.MapPageRoute(
                "AddDesignation",
                "Designation/Add",
                "~/Admin/Employee/AddDesignation.aspx");
            routes.MapPageRoute(
                "EditDesignation",
                "Designation/Edit",
                "~/Admin/Employee/EditDesignation.aspx");
            routes.MapPageRoute(
                "DepartmentDetails",
                "Department/Details",
                "~/Admin/Department/DepartmentDetails.aspx");
            routes.MapPageRoute(
                "JobAssignment",
                "Employee/JobAssignmentDetails",
                "~/Admin/Employee/EmpJobAssignmentDetails.aspx");
            routes.MapPageRoute(
                "NewJobAssignment",
                "Employee/AssignJob",
                "~/Admin/Employee/NewJobAssignment.aspx");
            routes.MapPageRoute(
              "AddUser",
              "User/New",
              "~/Admin/User/AddUser.aspx");

            routes.MapPageRoute(
               "UserDetails",
               "User/Details",
               "~/Admin/User/UserDetails.aspx");

            routes.MapPageRoute(
               "UserRoles",
               "User/Roles",
               "~/Admin/User/UserRoles.aspx");

            routes.MapPageRoute(
               "UserRolesAssign",
               "User/Roles/Assign",
               "~/Admin/User/AssignRole.aspx");



            // Main Navigation Static Route
            routes.MapPageRoute("NewEmployee", "AddEmployee", "~/Admin/Employee/AddEmployee");


        }
    }
}
