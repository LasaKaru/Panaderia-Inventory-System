using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Panaderia.test
{
    public partial class Supplier : System.Web.UI.Page
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

                LoadUserData();

            }



            {

                LoadData();



            }





        }





        private void LoadData()

        {

            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            string query = "SELECT Code, SupplierName, AddressLine1,AddressLine2,AddressLine3,Country,Telephone FROM [Panaderia].[dbo].[MF_Supplier_testing]";



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







        private void LoadUserData() { }









        protected void btnSave_Click(object sender, EventArgs e)

        {



            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))

            {

                string insertQuery = @"INSERT INTO [dbo].[MF_Supplier_testing]

                       ([SerialNumber],[Date],[User],[Code],[SupplierName],[AddressLine1],[AddressLine2],[AddressLine3],[Country]

                       ,[Telephone],[Fax],[Mobile],[Email],[ContactPerson1],[ContactDetails1],[ContactPerson2],[ContactDetails2],[ContactPerson3]

                       ,[ContactDetails3],[Notes],[CreditLimit],[CreditPeriod],[LeadTime],[SupplierType],[BankAndBranch],[AccountNo],[NameOnAccount]

                       ,[ActiveStatus],[LedgerAccount])

    

                    VALUES

                    (@SerialNumber,@Date, @User, @Code, @SupplierName, @AddressLine1, @AddressLine2, @AddressLine3, @Country,

                    @Telephone, @Fax, @Mobile, @Email, @ContactPerson1, @ContactDetails1,

                    @ContactPerson2, @ContactDetails2, @ContactPerson3, @ContactDetails3, @Notes, @CreditLimit, @CreditPeriod,@LeadTime,@SupplierType,@BankAndBranch,@AccountNo,@NameOnAccount,@ActiveStatus,@LedgerAccount)";



                using (SqlCommand cmd = new SqlCommand(insertQuery, con))

                {



                    con.Close();



                    cmd.Parameters.AddWithValue("@SerialNumber", SerialNumber.Text);

                    cmd.Parameters.AddWithValue("@Date", date.Text);

                    cmd.Parameters.AddWithValue("@User", user.Text);

                    cmd.Parameters.AddWithValue("@Code", txtcode.Text);

                    cmd.Parameters.AddWithValue("@SupplierName", txtname.Text);

                    cmd.Parameters.AddWithValue("@AddressLine1", txtadd1.Text);

                    cmd.Parameters.AddWithValue("@AddressLine2", txtadd2.Text);

                    cmd.Parameters.AddWithValue("@AddressLine3", txtadd3.Text);

                    cmd.Parameters.AddWithValue("@Country", txtcountry.Text);

                    cmd.Parameters.AddWithValue("@Telephone", txttele.Text);

                    cmd.Parameters.AddWithValue("@Fax", txtfax.Text);

                    cmd.Parameters.AddWithValue("@Mobile", txtmobile.Text);

                    cmd.Parameters.AddWithValue("@Email", txtemail.Text);

                    cmd.Parameters.AddWithValue("@ContactPerson1", txtcontactp1.Text);

                    cmd.Parameters.AddWithValue("@ContactDetails1", txtcontactdetail1.Text);

                    cmd.Parameters.AddWithValue("@ContactPerson2", txtcontactp2.Text);

                    cmd.Parameters.AddWithValue("@ContactDetails2", txtcontactdetail2.Text);

                    cmd.Parameters.AddWithValue("@ContactPerson3", txtcontactp3.Text);

                    cmd.Parameters.AddWithValue("@ContactDetails3", txtcontactdetail3.Text);

                    cmd.Parameters.AddWithValue("@Notes", txtnote.Text);

                    cmd.Parameters.AddWithValue("@CreditLimit", txtcreditlimit.Text);

                    cmd.Parameters.AddWithValue("@CreditPeriod", txtcreditperiod.Text);

                    cmd.Parameters.AddWithValue("@LeadTime", txtLtime.Text);

                    cmd.Parameters.AddWithValue("@SupplierType", ddlsupType.SelectedItem.Text.ToString());

                    cmd.Parameters.AddWithValue("@BankAndBranch", txtbankBranch.Text);

                    cmd.Parameters.AddWithValue("@AccountNo", txtaccNo.Text);

                    cmd.Parameters.AddWithValue("@NameOnAccount", txtaccName.Text);

                    cmd.Parameters.AddWithValue("@ActiveStatus", ddlActiveStatus.SelectedItem.Text.ToString());

                    cmd.Parameters.AddWithValue("@LedgerAccount", ddlledgeraccount.SelectedItem.Text.ToString());





                    con.Open();

                    cmd.ExecuteNonQuery();

                    Response.Write("Saved Successfully");





                }

            }
        



          

 

        }

 

        protected void btnBrowse_Click(object sender, EventArgs e)

        {

 

 

 

        }

 

        protected void btnExit_Click(object sender, EventArgs e)

        {

 

            Response.Redirect("../Master_File/Supplier.aspx");

 

        }

    }
}
