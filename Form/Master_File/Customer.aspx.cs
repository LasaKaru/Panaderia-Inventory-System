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
    public partial class Customer : System.Web.UI.Page
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

            if (!IsPostBack)


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
            string query = "SELECT Code, Telephone, Mobile,AddressLine1,AddressLine2,AddressLine3,Country,Email,CreditLimit,ActiveStatus FROM [Panaderia].[dbo].[MF_Customer_testing]";

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
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";



            using (SqlConnection con = new SqlConnection(connectionString))

            {

                string insertQuery = @"INSERT INTO [dbo].[MF_Customer_testing]

               ([SerialNumber],[Date],[User],[Code],[CustomerName],[AddressLine1],[AddressLine2],[AddressLine3],[Country]

               ,[Telephone],[Fax],[Mobile],[Email],[ContactPerson],[ContactDetails],[Notes],[CreditLimit],[CreditPeriod],[CustomerType],[CustomerVatNo],[ActiveStatus])

 

              VALUES           

                (@SerialNumber,@Date,@User, @Code,@CustomerName,@AddressLine1, @AddressLine2, @AddressLine3,@Country,@Telephone,

                 @Fax,@Mobile,@Email,@ContactPerson,@ContactDetails,@Notes,@CreditLimit,@CreditPeriod,@CustomerType,@CustomerVatNo,@ActiveStatus)";



                using (SqlCommand cmd = new SqlCommand(insertQuery, con))

                {

                    con.Close();



                    cmd.Parameters.AddWithValue("@SerialNumber", SerialNumber.Text);

                    cmd.Parameters.AddWithValue("@Date", Date.Text);

                    cmd.Parameters.AddWithValue("@User", User.Text);

                    cmd.Parameters.AddWithValue("@Code", txtCode.Text);

                    cmd.Parameters.AddWithValue("@CustomerName", txtName.Text);

                    cmd.Parameters.AddWithValue("@AddressLine1", txtAddress1.Text);

                    cmd.Parameters.AddWithValue("@AddressLine2", txtAddress2.Text);

                    cmd.Parameters.AddWithValue("@AddressLine3", txtAddress3.Text);

                    cmd.Parameters.AddWithValue("@Country", txtcountry.Text);

                    cmd.Parameters.AddWithValue("@Telephone", txtTele.Text);

                    cmd.Parameters.AddWithValue("@Fax", txtfax.Text);

                    cmd.Parameters.AddWithValue("@Mobile", txtmobile.Text);

                    cmd.Parameters.AddWithValue("@Email", txtemail.Text);

                    cmd.Parameters.AddWithValue("@ContactPerson", txtcontactp1.Text);

                    cmd.Parameters.AddWithValue("@ContactDetails", txtcontactdetail.Text);

                    cmd.Parameters.AddWithValue("@Notes", txtNote.Text);

                    cmd.Parameters.AddWithValue("@CreditLimit", txtcreditlimit.Text);

                    cmd.Parameters.AddWithValue("@CreditPeriod", txtcreditperiod.Text);

                    cmd.Parameters.AddWithValue("@CustomerType", dd1custype.SelectedItem.Text.ToString());

                    cmd.Parameters.AddWithValue("@CustomerVatNo", txtVatNo.Text);

                    cmd.Parameters.AddWithValue("@ActiveStatus", ddlActiveStatus.SelectedItem.Text.ToString());



                    con.Open();

                    cmd.ExecuteNonQuery();

                    Response.Write("Saved Successfully");

                    divMsg.Visible = true;

                    lblShowMessage.Visible = true;

                    lblShowMessage.Text = "Successfully inserted!";





                }



            }

        }

        protected void btnExit_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/Dashboard.aspx");

        }
    }
}