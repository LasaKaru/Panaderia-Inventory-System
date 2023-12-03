using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Panaderia.DataAccessLayer;
using System.Data;
using System.Data.SqlClient;

namespace Panaderia.Form.Inventory
{
    public partial class Sales_Invoice_Credit : System.Web.UI.Page
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
               // LoadData();
            }
            {
                LoadCusData();
            }
            {
                LoadOrderData();
            }
            {
                LoadItemData();
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

        private void LoadCusData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = " SELECT cus_nu,Code,CustomerName, AddressLine1,Telephone, Mobile,Country,Email,CreditLimit,ActiveStatus FROM [Panaderia].[dbo].[MF_Customer_new]";

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

        private void LoadOrderData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT OR_nu,cus_nu,code, cus_name,Amount,CustomerReference,Discount,Comments FROM [Panaderia].[dbo].[sales_order]";

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

       /* private void LoadData()
        {
            try
            {
                clsCOMMON obj_ = new clsCOMMON();

                obj_.EMPID = "";

                DataTable dt = obj_.GetinvoiceCreditData(obj_).Tables[0];


                String companyID = dt.Rows[0][0].ToString();
                String strbranch = dt.Rows[0][1].ToString();
                String txn = dt.Rows[0][2].ToString();
                String num = dt.Rows[0][3].ToString();

                company.Text = companyID;
                Branch.Text = strbranch;
                TxnType.Text = txn;
                Number.Text = num;
            }
            catch (Exception excLSK)
            {

                throw;
            }
        }

        */

        protected void btnCustomer_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string insertQuery = @"INSERT INTO [dbo].[Inv_Invoice_credit]
                                    ([CompanyID],[IPS_Date],[Branch],[TxnType],[Number],[User],[cus_nu],[code],[cus_name],[Amount],[CustomerReferance],
                                    [Discount],[Comments],[SO_nu])
                                    VALUES
                                    (@CompanyID,@IPS_Date,@Branch,@TxnType,@Number,@User,@cus_nu,@code,@cus_name,@Amount,@CustomerReferance,@Discount,@txtComments,@SO_nu)";



                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {

                    con.Close();

                    cmd.Parameters.AddWithValue("@CompanyID", company.Text);
                    cmd.Parameters.AddWithValue("@IPS_Date", date.Text);
                    cmd.Parameters.AddWithValue("@Branch", Branch.Text);
                    cmd.Parameters.AddWithValue("@TxnType", TxnType.Text);
                    cmd.Parameters.AddWithValue("@Number", Number.Text);
                    cmd.Parameters.AddWithValue("@User", user.Text);
                    cmd.Parameters.AddWithValue("@cus_nu", txtCustomer.Text);
                    cmd.Parameters.AddWithValue("@code", txtcusID.Text);
                    cmd.Parameters.AddWithValue("@cus_name", txtCusname.Text);
                    cmd.Parameters.AddWithValue("@Amount", txtamount.Text);
                    cmd.Parameters.AddWithValue("@CustomerReferance", txtaReferance.Text);
                    cmd.Parameters.AddWithValue("@Discount", txtDiscount.Text);
                    cmd.Parameters.AddWithValue("@txtComments", txtComments.Text);
                    cmd.Parameters.AddWithValue("@SO_nu", txtSONum.Text);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("Saved Successfully");
                }

            }
            // Display a JavaScript alert using ScriptManager
            string script = "alert('Saved Successfully');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "SavedSuccessfullyScript", script, true);
        }

        protected void btnBrowse_Click(object sender, EventArgs e)
        {

        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");
        }
    }
}