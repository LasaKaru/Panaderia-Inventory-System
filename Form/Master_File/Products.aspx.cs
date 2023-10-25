using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace Panaderia.Form.Master_File
{
    public partial class Products : System.Web.UI.Page
    {
        // Define your connection string
        string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize the form
            }

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            // Implement the logic to save the product data
            // Access form values using Request.Form collection or controls' values like txtUserID.Text
            // Get values from form controls
            //string SerialNumber = txtUserID.Text;
            //string type = ddltype.SelectedValue;
           // string description = txtdiscription.Text;
           // string userID = txtUserID.Text;
          //  string type = ddltype.SelectedValue;
           // string description = txtdiscription.Text;
            // Add more fields as needed

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
    }
}