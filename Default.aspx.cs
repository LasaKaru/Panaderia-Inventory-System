using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Panaderia
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Hide the login form initially
                loginForm.Visible = false;
            }
        }

        protected void btnShowLogin_Click(object sender, EventArgs e)
        {

            //Hide The Login Button
            btnShowLogin.Visible = false;
            // Show the login form when the "Login" button is clicked
            loginForm.Visible = true;

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Your login logic remains the same as in your provided code
            // Define your hardcoded username and password
            string validUsername = "sa";
            string validPassword = "1";

            // Get the values entered by the user
            string enteredUsername = txtUsername.Text;
            string enteredPassword = txtPassword.Text;

            // Check if the entered credentials match the valid credentials
            if (enteredUsername == validUsername && enteredPassword == validPassword)
            {
                lblMessage.Text = "Login successful!";

                // Set the valid login user name in the Session object.
                System.Web.HttpContext.Current.Session["ValidUsername"] = validUsername;


                // Call the JavaScript function to hide the jumbotron
                ClientScript.RegisterStartupScript(this.GetType(), "ShowNavigationBar", "showNavigationBar();", true); ;
                // Redirect to another page or perform further actions here

                // Redirect to the dashboard page after successful login
                Response.Redirect("~/dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }

        /*
         * 
         * 
         ******************if used a database connection to login**********
         * 
        protected void btnLogin_Click(object sender, EventArgs e)
{
    // Get the values entered by the user
    string enteredUsername = txtUsername.Text;
    string enteredPassword = txtPassword.Text;

    // Define your database connection string
    string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

    using (SqlConnection connection = new SqlConnection(connectionString))
    {
        connection.Open();

        // Check if the entered credentials match a user in the database
        string query = "SELECT User_Name FROM MF_User WHERE User_Name = @Username AND User_Password = @Password";
        using (SqlCommand command = new SqlCommand(query, connection))
        {
            command.Parameters.AddWithValue("@Username", enteredUsername);
            command.Parameters.AddWithValue("@Password", enteredPassword);

            // Execute the query
            string validUsername = (string)command.ExecuteScalar();

            if (!string.IsNullOrEmpty(validUsername))
            {
                lblMessage.Text = "Login successful!";
                
                // Set the valid login user name in the Session object.
                System.Web.HttpContext.Current.Session["ValidUsername"] = validUsername;

                // Call the JavaScript function to hide the jumbotron
                ClientScript.RegisterStartupScript(this.GetType(), "ShowNavigationBar", "showNavigationBar();", true);
                
                // Redirect to the dashboard page after successful login
                Response.Redirect("~/dashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }
} 
         
         */
    }
}