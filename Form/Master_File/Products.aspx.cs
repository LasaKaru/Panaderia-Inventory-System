using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;


namespace Panaderia.Form.Master_File
{
    public partial class Products : System.Web.UI.Page
    {
        // Define your connection string
        string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
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

            if (!IsPostBack)
            {
                // Initialize the form
            }

            {
                LoadData();
            }

            {
                LoadUserData();
            }

            {
                // Call a method to retrieve the next available serial number
                string nextSerialNumber = GetNextSerialNumberForUser(LoggedInUserId);

                // Set the retrieved serial number in the TextBox
                SerialNumber.Text = nextSerialNumber;
            }

        }

        private void LoadUserData() { }


        /**
        {
            // Implement the logic to load user data from the database
            // need to replace the connection string and SQL query with your actual values
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=MyBooks;Integrated Security=True";
            string query = "SELECT UserID, UserName, DefaultStore, UserGroup, UserPassword, UserStatus FROM MF_Users WHERE UserID = @UserID";

            // Assume you have a user ID stored in a session variable or some other source
            string userId = "123"; // Replace this with the actual user ID

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@UserID", userId);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        // Populate the controls with data from the database
                        txtUserID.Text = reader["UserID"].ToString();
                        txtUserName.Text = reader["UserName"].ToString();
                        ddlDefaultStore.SelectedValue = reader["DefaultStore"].ToString();
                        ddlUserGroup.SelectedValue = reader["UserGroup"].ToString();
                        txtUserPassword.Text = reader["UserPassword"].ToString();
                        ddlUserStatus.SelectedValue = reader["UserStatus"].ToString();
                        // Populate other controls as needed
                    }
                }
            }


        } **/

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

        protected void LoadData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT Code, P_type, P_Description, UnitSize, UnitInCase, UOM, Category1, Category2, Category3, Category4, STDCostPrice, STDSellingPrice, MaximumMarkup, NBT, VAT, P_status FROM [Panaderia].[dbo].[MF_Product_Testing]";
           

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

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            // Implement the logic to save the product data
            // Access form values using Request.Form collection or controls' values like txtUserID.Text
            // Get values from form controls
            //string SerialNumber = txtUserID.Text;
            //string type = ddltype.SelectedValue;
            //string description = txtdiscription.Text;
           // string userID = txtUserID.Text;
           // string type = ddltype.SelectedValue;
           // string description = txtdiscription.Text;
           //  Add more fields as needed

            // Establish a database connection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Create a SQL command
                string insertQuery = "INSERT INTO MF_Product (UserID, Type, Description) VALUES (@UserID, @Type, @Description)";
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    // Add parameters and set their values
                   //command.Parameters.AddWithValue("@SerialNumber", SerialNumber);
                    //command.Parameters.AddWithValue("@Type", type);
                  //  command.Parameters.AddWithValue("@UserID", userID);
                    //command.Parameters.AddWithValue("@P_Type", type);
                   // command.Parameters.AddWithValue("@Description", description);
                    // Add more parameters for other fields

                    // Execute the query
                    command.ExecuteNonQuery();
                }
            }
            // Optionally, you can redirect to another page or display a success message
        }
    

        // Event handler for the "Browse" button
        protected void BtnBrowse_Click(object sender, EventArgs e)
        {
            // Implement the logic to browse for a file and handle file upload
        }

        // Event handler for the "Exit" button
        protected void BtnExit_Click(object sender, EventArgs e)
        {
        // Implement the logic to exit or redirect to another page
        Response.Redirect("dashboard.aspx");
        }

        // Additional event handlers for select/dropdown change events (e.g., updatetypeText, updateUOMText, etc.)
        protected void updatetypeText()
        {
            // Handle the dropdown change event for "Type" dropdown
        }

        // Add similar event handlers for other dropdowns
        // ...

        // Additional logic for file upload handling
        private void HandleFileUpload()
        {
            // Implement the logic to handle file upload
        }

        protected void txtNBT_TextChanged(object sender, EventArgs e)
        {
            

        }

        protected void txtTaxCode_TextChanged(object sender, EventArgs e)
        {


        }

        protected void btn_save_Click(object sender, EventArgs e)
        {


        }

        protected void txtNBT_TextChanged2(object sender, EventArgs e)
        {


        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");
        }


    }
}