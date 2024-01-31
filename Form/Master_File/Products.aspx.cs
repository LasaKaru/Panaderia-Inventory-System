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
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT Code, P_Type, P_Description,UnitSize,UnitInCase,UOM,STDCostPrice,STDSellingPrice,MaximumMarkup,NBT,VAT FROM [Panaderia].[dbo].[MF_Product_testing1]";

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

        private void LoadUserData()
        {

        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Check if the record with the specified SerialNumber already exists
                string checkIfExistsQuery = "SELECT COUNT(*) FROM [dbo].[MF_Product_testing1] WHERE [Code] = @Code";

                using (SqlCommand checkCmd = new SqlCommand(checkIfExistsQuery, con))
                {
                    checkCmd.Parameters.AddWithValue("@Code", txtCode.Text);

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
            string insertQuery = @"INSERT INTO [dbo].[MF_Product_testing1]
                ([SerialNumber],[Date],[User],[Code],[P_Type],[P_Description],[UnitSize],[UnitInCase],[UOM]
                ,[Category1],[Category2],[Category3],[Category4],[STDCostPrice],[STDSellingPrice],[Tax],[MaximumMarkup]
                ,[NBT],[VAT],[P_Status])
            VALUES
                ( @SerialNumber, @Date, @User, @Code,@P_Type, @P_Description, @UnitSize, @UnitInCase, @UOM, @Category1, @Category2,
                @Category3, @Category4, @STDCostPrice, @STDSellingPrice, @Tax, @MaximumMarkup, @NBT, @VAT, @P_Status)";

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
            UPDATE [dbo].[MF_Product_testing1]
            SET
                [Date] = @Date,
                [User] = @User,
                [Code] = @Code,
                [P_Type] = @P_Type,
                [P_Description] = @P_Description,
                [UnitSize] = @UnitSize,
                [UnitInCase] = @UnitInCase,
                [UOM] = @UOM,
                [Category1] = @Category1,
                [Category2] = @Category2,
                [Category3] = @Category3,
                [Category4] = @Category4,
                [STDCostPrice] = @STDCostPrice,
                [STDSellingPrice] = @STDSellingPrice,
                [Tax] = @Tax,
                [MaximumMarkup] = @MaximumMarkup,
                [NBT] = @NBT,
                [VAT] = @VAT,
                [P_Status] = @P_Status
            WHERE [Code] = @Code";

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
            cmd.Parameters.AddWithValue("@Code", txtCode.Text);
            cmd.Parameters.AddWithValue("@P_Type", ddltype.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("@P_Description", txtdescription.Text);
            cmd.Parameters.AddWithValue("@UnitSize", txtUnitSize.Text);
            cmd.Parameters.AddWithValue("@UnitInCase", txtUnitInCase.Text);
            cmd.Parameters.AddWithValue("@UOM", ddlUOM.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("@Category1", ddlcate1.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("@Category2", ddlcate2.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("@Category3", ddlcate3.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("@Category4", ddlcate4.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("@STDCostPrice", txtSTDCostPrice.Text);
            cmd.Parameters.AddWithValue("@STDSellingPrice", txtSTDSellingPrice.Text);
            cmd.Parameters.AddWithValue("@MaximumMarkup", txtMaximumMarkup.Text);
            cmd.Parameters.AddWithValue("@NBT", txtNBT.Text);
            cmd.Parameters.AddWithValue("@VAT", txtVAT.Text);
            cmd.Parameters.AddWithValue("@Tax", ddlTaxCode.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("@P_Status", ddlactiveStatus.SelectedItem.Text.ToString());
            // cmd.Parameters.AddWithValue("@ImagePath", myFile.Text);   


        }

        protected void btn_browse_Click(object sender, EventArgs e)
        {


        }

        protected void btn_exit_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Master_File/Products.aspx");

        }

        protected void txtNBT_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtTaxCode_TextChanged(object sender, EventArgs e)
        {


        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");
        }


    }
}