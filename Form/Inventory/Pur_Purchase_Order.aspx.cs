using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.IO;
using Panaderia.DataAccessLayer;


namespace Panaderia.Form.Inventory
{
    public partial class Pur_Purchase_Order : System.Web.UI.Page
    {
        private static string query;

        public static object yourEndDateValue { get; private set; }
        public static object yourStartDateValue { get; private set; }

        

        public static string GetData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string data = "SELECT * FROM dbo.TX_Inventory"; // Fetch all data

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(data, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Retrieve the schema (column names) from the reader
                        var schema = reader.GetSchemaTable();

                        // Create a list to store column names
                        List<string> columnNames = new List<string>();

                        foreach (DataRow column in schema.Rows)
                        {
                            string columnName = column.Field<string>("ColumnName");
                            columnNames.Add(columnName);
                        }

                        // Use columnNames list to generate the header row in the modal content
                        string headerRow = string.Join(", ", columnNames);

                        // Create a StringBuilder to build the response
                        StringBuilder response = new StringBuilder();
                        response.Append(headerRow); // Add header row

                        // Loop through the data and append each row
                        while (reader.Read())
                        {
                            List<string> rowValues = new List<string>();
                            foreach (string columnName in columnNames)
                            {
                                // Read the value of each column and escape any special characters
                                string value = HttpUtility.HtmlEncode(reader[columnName].ToString());
                                rowValues.Add(value);
                            }

                            string row = string.Join(", ", rowValues);
                            response.Append("\n" + row); // Add row data
                        }

                        return response.ToString();
                    }
                }
            }

            return string.Empty; // Return empty string in case of no data or errors
        }

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
             //   LoadUserData();
            }
            {
              //  LoadData();
            }
            {
                LoadSupData();
            }
            {
                LoadItemData();
            }

        }


        private void LoadSupData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT Sup_nu,Code,SupplierName,Telephone,ContactPerson1,ContactDetails1,Email FROM [Panaderia].[dbo].[MF_Supplier_new1]";

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

        private void LoadItemData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT item_nu,code,Description,Price,PSize,Pascks,Nos,Dis,Amount,Usize FROM [Panaderia].[dbo].[MF_item]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        GridView3.DataSource = reader;
                        GridView3.DataBind();
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

        /*
        private void LoadUserData() { }

        private void LoadData()
        {
            try
            {
                clsCOMMON obj_ = new clsCOMMON();

                obj_.EMPID = "";

                DataTable dt = obj_.GetPurchaseData(obj_).Tables[0];


                String companyID = dt.Rows[0][0].ToString();
                String strbranch = dt.Rows[0][1].ToString();
                String txn = dt.Rows[0][2].ToString();

                company.Text = companyID;
                Branch.Text = strbranch;
                TxnType.Text = txn;
            }
            catch (Exception excLSK)
            {

                throw;
            }
        }
        */


        protected void btnSave_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string insertQuery = @"INSERT INTO [dbo].[Inv_Purchase_Order_new]
                   ([CompanyID], [IPS_Date], [Branch], [TxnType], [Number], [User], [Code], [Sup_Name], [Amount], [SupplierReference], [Discount], [Comments],[Sup_nu])
                   VALUES
                   (@CompanyID, @IPS_Date, @Branch, @TxnType, @Number, @User, @Code, @Sup_Name, @Amount, @SupplierReference, @Discount, @Comments,@Sup_nu)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    // No need to close the connection before opening it

                    cmd.Parameters.AddWithValue("@CompanyID", company.Text);
                    cmd.Parameters.AddWithValue("@IPS_Date", date.Text);
                    cmd.Parameters.AddWithValue("@Branch", Branch.Text);
                    cmd.Parameters.AddWithValue("@TxnType", TxnType.Text);
                    cmd.Parameters.AddWithValue("@Number", Number.Text);
                    cmd.Parameters.AddWithValue("@User", user.Text);
                    cmd.Parameters.AddWithValue("@Sup_nu", txtsupplier.Text);
                    cmd.Parameters.AddWithValue("@Code", txtsupid.Text);
                    cmd.Parameters.AddWithValue("@Sup_Name", txtsup.Text);
                    cmd.Parameters.AddWithValue("@Amount", txtamount.Text);
                    cmd.Parameters.AddWithValue("@SupplierReference", txtreferance.Text);
                    cmd.Parameters.AddWithValue("@Discount", txtdiscount.Text);
                    cmd.Parameters.AddWithValue("@Comments", txtcomments.Text);


                    con.Open();
                    cmd.ExecuteNonQuery();

                    // Response.Write("Saved Successfully");

                    divMsg.Visible = true;
                    lblShowMessage.Visible = true;
                    lblShowMessage.Text = "Successfully inserted!";
                }
            }
        }



        /*
            protected void btnSave_Click(object sender, EventArgs e)
        {

            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string insertQuery = @"INSERT INTO [dbo].[Inv_Purchase_Sales_purchaseOrder]
                ([CompanyID],[IPS_Date],[Branch],[TxnType],[Number],[User],[SupplierID],[Amount],[SupplierReferance],[Discount],[Comments])
                VALUES
                (@CompanyID,@IPS_Date,@Branch,@TxnType, @Number,@User,@SupplierID, @Amount,@SupplierReferance,@Discount,@Comments)";
                                 
                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {

                    con.Close();


                    cmd.Parameters.AddWithValue("@CompanyID", company.Text);
                    cmd.Parameters.AddWithValue("@IPS_Date", date.Text);
                    cmd.Parameters.AddWithValue("@Branch", Branch.Text);
                    cmd.Parameters.AddWithValue("@TxnType", TxnType.Text);
                    cmd.Parameters.AddWithValue("@Number", Number.Text);
                    cmd.Parameters.AddWithValue("@User", user.Text);
                    cmd.Parameters.AddWithValue("@txtsupplier", user.Text);
                    cmd.Parameters.AddWithValue("@Amount", txtamount.Text);
                    cmd.Parameters.AddWithValue("@SupplierReferance", txtreferance.Text);
                    cmd.Parameters.AddWithValue("@Discount", txtdiscount.Text);
                    cmd.Parameters.AddWithValue("@Comments", txtcomments.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    // Response.Write("Saved Successfully");

                    divMsg.Visible = true;
                    lblShowMessage.Visible = true;
                    lblShowMessage.Text = "Successfully inserted!";

                }

            }
            // Display a JavaScript alert using ScriptManager
            /*string script = "alert('Saved Successfully');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "SavedSuccessfullyScript", script, true);*/





        protected void btnBrowse_Click(object sender, EventArgs e)
        {


        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            // Iterate through GridView rows and save data to the database
            foreach (GridViewRow row in GridView3.Rows)
            {
                // Access each cell value and save to the database
                string itemNu = row.Cells[0].Text;
                string textBox2Value = row.Cells[1].Text;
                // ... (repeat for other cells)

                // Perform database insertion logic here
                // ...
            }
        }








    }
}