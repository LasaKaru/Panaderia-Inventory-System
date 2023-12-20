using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Panaderia.DataAccessLayer;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.IO;


namespace Panaderia.test
{
    public partial class puror : System.Web.UI.Page
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
                LoadUserData();
            }

            {
                LoadSupData();
            }
            // Your connection string
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            ScriptManager.RegisterStartupScript(this, GetType(), "SaveDataScript", "function saveDataToServer() { SaveData(); }", true);
            ScriptManager.RegisterStartupScript(this, GetType(), "GetDataScript", "function refreshGridView() { GetData(); }", true);
            // Your existing code

            // Register the SaveData method as a web service
            ScriptManager.RegisterStartupScript(this, GetType(), "SaveDataScript", "function saveDataToServer() { SaveData(); }", true);

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

                        GridView2.DataSource = reader;
                        GridView2.DataBind();
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

        private void LoadUserData() { }










        protected void yourGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Footer)
            {
                // Calculate and display the total amount in the footer
                double totalAmount = CalculateTotalAmount();

                // Find the Labels in the footer and update their text
                Label lblTotalAmount = (Label)e.Row.FindControl("lblTotalAmount");
                if (lblTotalAmount != null)
                {
                    lblTotalAmount.Text = totalAmount.ToString("0.00");
                }
            }
        }

        private double CalculateTotalAmount()
        {
            // Your logic to calculate the total amount
            // Iterate through the GridView data source and sum the amounts
            double totalAmount = 0.0;
            foreach (GridViewRow row in yourGridView.Rows)
            {
                // Access the amount value in each row and add to the total
                TextBox txtAmount1 = (TextBox)row.FindControl("txtAmount1");
                if (txtAmount1 != null)
                {
                    totalAmount += Convert.ToDouble(txtAmount1.Text);
                }
            }
            return totalAmount;
        }
















        protected void btnSave1_Click(object sender, EventArgs e)
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
        protected void yourGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

    }
}