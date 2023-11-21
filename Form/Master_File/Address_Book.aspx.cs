using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace Panaderia.Form.Master_File
{
    public partial class Address_Book : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the current date and time from the database or server.
            DateTime dt = DateTime.Now;

            // Set the value of the TextBox control.
            Date.Text = dt.ToString("yyyy-MM-dd HH:mm:ss");

            // Get the valid login user name from the default.aspx.cs code btnLogin_Click() function.
            string validUsername = (string)System.Web.HttpContext.Current.Session["ValidUsername"];

            // Set the value of the TextBox control.
            User.Text = validUsername;


            // Load the user data from the database when the page is loaded
            if (!IsPostBack) // Ensure that the code is executed only on the initial page load, not on postbacks


            {
                // Initialize the hidden field value (data not saved)
                hdnDataSaved.Value = "false";
                // Call a method to retrieve the next available serial number
                string nextSerialNumber = GetNextSerialNumberForUser(LoggedInUserId);

                // Set the retrieved serial number in the TextBox
                SerialNumber.Text = nextSerialNumber;
            }

            {
                LoadUserData();
            }
            {
                LoadData();
            }

            {
                SaveOrUpdateUserData();
            }

            

        }


        private void SaveOrUpdateUserData()
        {
          // Check if the data needs to be saved or updated based on the hidden field value
          bool dataSaved = hdnDataSaved.Value.ToLower() == "true";

          // Replace the connection string and SQL query with your actual values
             string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query;

                if (dataSaved)
               {
                  // Update query
                query = "UPDATE MF_Address_Book SET Date = @Date, User_Name = @User_Name, " +
                "User_BranchCode = @User_BranchCode, User_Group = @User_Group, " +
                "User_Password = @User_Password, User_Status = @User_Status " +
                "WHERE SerialNumber = @SerialNumber";
                 }
                 else
                 {
                    // Insert query
                query = "INSERT INTO MF_Address_Book (SerialNumber, Date, User, User_Name, " +
                "User_BranchCode, User_Group, User_Password, User_Status) " +
                "VALUES (@SerialNumber, @Date, @User, @User_Name, " +
                "@User_BranchCode, @User_Group, @User_Password, @User_Status)";
                  }

                  using (SqlConnection connection = new SqlConnection(connectionString))
                  {
                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                              // Add parameters and set their values based on the data from your controls
                              //command.Parameters.AddWithValue("@SerialNumber", SerialNumber.Text);
                              //command.Parameters.AddWithValue("@Date", Date.Text);
                              //command.Parameters.AddWithValue("@User", User.Text);
                              //command.Parameters.AddWithValue("@User_Name", txtShortName.Text);
                              

                              //command.Parameters.AddWithValue("@User_Status", ddlUserStatus.SelectedValue);

                              connection.Open();
                              command.ExecuteNonQuery();
                            }
                  }

           // Display a message or handle UI changes after saving or updating
            Response.Write("Data saved or updated successfully!");
        }

        // Replace "LoggedInUserId" with the actual way you get the logged-in user's user_id.
        private int LoggedInUserId
        {
            get
            {
                // You need to implement a way to get the user's ID (e.g., from session or authentication).
                // Replace this with the appropriate code to retrieve the logged-in user's ID.
                if (Session["LoggedInUserId"] != null)
                {
                    return Convert.ToInt32(Session["LoggedInUserId"]);
                }
                return 0; // You should handle this case based on your application's authentication.
            }
        }

        protected void LoadData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT Code, ShortName, FullName, AddressLine1, AddressLine2, CityRegion, Country, Telephone, Fax, Mobile, Email, ContactPerson, ContactDetails, Notes, UserStatus FROM[Panaderia].[dbo].[MF_Address_Book]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        GridView1.DataSource = reader;
                        GridView1.DataBind();
                    }
                    catch (Exception ex)
                    {
                        // Handle any exceptions here
                        string errorMessage = "An error occurred while fetching data. Please try again later.";

                        // Display the error message to the user
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "errorAlert", $"alert('{errorMessage}');", true);
                    }
                }
            }
        }
        


        private string GetNextSerialNumberForUser(int userId)
        {
            // Implement your database query logic here to fetch the next serial number for the given user from the database.
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Example query (you should customize it based on your database schema):
                string query = "SELECT MAX(User_Id) + 1 FROM MF_User WHERE User_Id = @User_Id";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@User_Id", userId);

                    object result = command.ExecuteScalar();

                    if (result != DBNull.Value)
                    {
                        // Format the serial number as needed (e.g., zero-padding).
                        int nextSerialNumber = Convert.ToInt32(result);
                        return nextSerialNumber.ToString("0000"); // Adjust the formatting as needed.
                    }
                    else
                    {
                        // No previous serial numbers found; you might want to start from a specific value.
                        return "0001"; // Adjust this initial serial number as needed.
                    }
                }
            }

        }
        private void LoadUserData() 
        { 
        
        }

        protected void BtnBrowse_Click(object sender, EventArgs e)
        {
            // Implement the logic to retrieve and display user data from the database
            BrowseUserData();
        }

        private void BrowseUserData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT * FROM MF_User"; // Modify the query to select the columns you need
            //string query = "SELECT SerialNumber, Date, User, UserID, UserName, DefaultStore, UserGroup, UserPassword, UserStatus FROM MF_Users";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Process the data using the reader
                        while (reader.Read())
                        {
                            // Access columns like this:
                            int userId = reader.GetInt32(reader.GetOrdinal("User_Id"));
                            string userCode = reader.GetString(reader.GetOrdinal("User_Code"));
                            string userName = reader.GetString(reader.GetOrdinal("User_Name"));
                            // ... and so on for other columns
                        }
                    }
                }
            }
        }

        protected void BtnExit_Click(object sender, EventArgs e)
        {
            // Exit button click event handling

            // Implement the logic to redirect to the dashboard.aspx
            //Response.Redirect("~/Dashboard.aspx");

            // Implement the logic to show a confirmation prompt using JavaScript
            string script = "if (confirm('Are you sure you want to exit?')) { window.location.href = 'Dashboard.aspx'; }";
            ClientScript.RegisterStartupScript(this.GetType(), "ConfirmExit", script, true);

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            // Save button click event handling
            SaveUserData();

        }

        private void SaveUserData()
        {
            // Implement the logic to save data to the database
            // need to replace the connection string and SQL query with your actual values
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            //string query = "INSERT INTO MF_Users (SerialNumber, Date, User, UserID, UserName, DefaultStore, UserGroup, UserPassword, UserStatus) " +
            //               "VALUES (@SerialNumber, @Date, @User, @UserID, @UserName, @DefaultStore, @User_Group, @User_Cur_Password, @User_Status)";

            string query = "INSERT INTO MF_Address_Book (SerialNumber, Date, User, User_Name, User_BranchCode, User_Group, User_Password, User_Status) " +
                           "VALUES (@SerialNumber, @Date, @User, @User_Name, @User_BranchCode,, @User_Group, @User_Password, @User_Status)";


            // Assume have a user ID stored in a session variable or some other source
            //string userId = "123"; // Replace this with the actual user ID

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters and set their values based on the data from your controls
                    command.Parameters.AddWithValue("(@SerialNumber", SerialNumber.Text);
                    command.Parameters.AddWithValue("@Date", Date.Text);
                    command.Parameters.AddWithValue("@User", User.Text);
                   // command.Parameters.AddWithValue("@User_ID", txtUserID.Text);
                    command.Parameters.AddWithValue("@User_Name", txtShortName.Text);
                   // command.Parameters.AddWithValue("@User_Name", txtFullName.Text);
                   // command.Parameters.AddWithValue("@User_BranchCode,", ddlDefaultStore.SelectedValue);
                   // command.Parameters.AddWithValue("@User_Group", ddlUserGroup.SelectedValue);
                  //  command.Parameters.AddWithValue("@User_Password", txtUserPassword.Text);
                    command.Parameters.AddWithValue("@User_Status", ddlUserStatus.SelectedValue);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            // add a message or redirect the user to another page after saving
            Response.Write("Data saved successfully!");

            // redirect the user to another page after saving
            //Response.Redirect("user_Profile.aspx");
        }
    }
}