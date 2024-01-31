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
            date.Text = dt.ToString("yyyy-MM-dd HH:mm:ss");

            // Get the valid login user name from the default.aspx.cs code btnLogin_Click() function.
            string validUsername = (string)System.Web.HttpContext.Current.Session["ValidUsername"];

            // Set the value of the TextBox control.
            user.Text = validUsername;


            // Load the user data from the database when the page is loaded
            if (!IsPostBack) // Ensure that the code is executed only on the initial page load, not on postbacks


            {
                // Call a method to retrieve the next available serial number
                string nextSerialNumber = GetNextSerialNumberForUser(LoggedInUserId);

                // Set the retrieved serial number in the TextBox
                SerialNumber.Text = nextSerialNumber;
            }

            {
                LoadData();
            }
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
        private string GetNextSerialNumberForUser(int userId)
        {
            // Implement your database query logic here to fetch the next serial number for the given user from the database.
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
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
        private void LoadData()
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "  SELECT ADD_CODE, SHORT_NAME, FULL_NAME,ADD1,ADD2,TEL1,FAX1,MOB1,EMAIL1 FROM [Panaderia].[dbo].[MF_Address]";
            ;

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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Check if the record with the specified SerialNumber already exists
                string checkIfExistsQuery = "SELECT COUNT(*) FROM [dbo].[MF_Address] WHERE [ADD_CODE] = @ADD_CODE";

                using (SqlCommand checkCmd = new SqlCommand(checkIfExistsQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@ADD_CODE", txtCode.Text);

                    int existingRecordCount = (int)checkCmd.ExecuteScalar();

                    if (existingRecordCount > 0)
                    {
                        // If the record exists, perform an update
                        UpdateRecord(con);
                    }
                    else
                    {
                        // If the record does not exist, perform an insert
                        InsertRecord(con);
                    }
                }
            }
        }

        private void InsertRecord(SqlConnection con)
        {
            string insertQuery = @"
        INSERT INTO [dbo].[MF_Address]
           ([SerialNumber],[Date],[User],[ADD_CODE],[SHORT_NAME],[FULL_NAME],[ADD1],[ADD2],[city],[Country],[TEL1],[FAX1]
           ,[MOB1],[EMAIL1],[CON_PERSON1],[contact_detail],[note],[ACTIVE_STATUS])
     VALUES      
                (@SerialNumber,@Date,@User, @ADD_CODE,@SHORT_NAME,@FULL_NAME, @ADD1, @ADD2,@city,@Country,
                 @TEL1,@FAX1,@MOB1,@EMAIL1,@CON_PERSON1,@contact_detail,@note,@ACTIVE_STATUS)";






            using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
            {
                SetParameters(insertCmd);

                insertCmd.ExecuteNonQuery();

                Response.Write("Saved Successfully");

                divMsg.Visible = true;
                lblShowMessage.Visible = true;
                lblShowMessage.Text = "Successfully inserted!";
            }
        }

        private void UpdateRecord(SqlConnection con)
        {
            string updateQuery = @"
            UPDATE [dbo].[MF_Address]
            SET
                [Date] = @Date,
                [User] = @User,
                [ADD_CODE] = @ADD_CODE,
                [SHORT_NAME] = @SHORT_NAME,
                [FULL_NAME] = @FULL_NAME,
                [ADD1] = @ADD1,
                [ADD2] = @ADD2,
                [city] = @city,
                [Country] = @Country,
                [TEL1] = @TEL1,
                [FAX1] = @FAX1,
                [MOB1] = @MOB1,
                [EMAIL1] = @EMAIL1,
                [CON_PERSON1] = @CON_PERSON1,
                [contact_detail] = @contact_detail,
                [note] = @note,
                [ACTIVE_STATUS] = @ACTIVE_STATUS            
            WHERE [ADD_CODE] = @ADD_CODE";


            using (SqlCommand updateCmd = new SqlCommand(updateQuery, con))
            {
                SetParameters(updateCmd);

                updateCmd.ExecuteNonQuery();

                Response.Write("Updated Successfully");

                divMsg.Visible = true;
                lblShowMessage.Visible = true;
                lblShowMessage.Text = "Successfully updated!";
            }
        }

        private void SetParameters(SqlCommand cmd)
        {
            cmd.Parameters.AddWithValue("@SerialNumber", SerialNumber.Text);
            cmd.Parameters.AddWithValue("@Date", date.Text);
            cmd.Parameters.AddWithValue("@User", user.Text);
            cmd.Parameters.AddWithValue("@ADD_CODE", txtCode.Text);
            cmd.Parameters.AddWithValue("@SHORT_NAME", txtShortName.Text);
            cmd.Parameters.AddWithValue("@FULL_NAME", txtFullName.Text);
            cmd.Parameters.AddWithValue("@ADD1", txtAddress1.Text);
            cmd.Parameters.AddWithValue("@ADD2", txtAddress2.Text);
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
            cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
            cmd.Parameters.AddWithValue("@TEL1", txtTelephone.Text);
            cmd.Parameters.AddWithValue("@FAX1", txtFax.Text);
            cmd.Parameters.AddWithValue("@MOB1", txtMobile.Text);
            cmd.Parameters.AddWithValue("@EMAIL1", txtEmail.Text);
            cmd.Parameters.AddWithValue("@CON_PERSON1", txtContact.Text);
            cmd.Parameters.AddWithValue("@contact_detail", txtDetails.Text);
            cmd.Parameters.AddWithValue("@note", txtNotes.Text);
            cmd.Parameters.AddWithValue("@ACTIVE_STATUS", ddlUserStatus.SelectedItem.Text.ToString());
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");
        }

    }
}