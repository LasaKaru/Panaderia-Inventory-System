using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Panaderia.DataAccessLayer;

namespace Panaderia.Form.Day_Books
{
    public partial class SetOFF_Receipt : System.Web.UI.Page
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
                LoadsubledgerData();
            }

        }

        private void LoadUserData() { }
        private void LoadsubledgerData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "  SELECT SUP_NO,ACC_NO,SUP_NAME,SUP_CODE,SUP_STATUS FROM [MyBooks].[dbo].[MF_Supplier] ";

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
                string insertQuery = @"INSERT INTO [dbo].[setoff_payment]
           ([CompanyID],[IPS_Date],[Branch],[TxnType],[Number],[User],[[Subledger_acc]],[sup_name],[Amount],[ledger_Acc]
           ,[SupplierReferance],[Reason],[Details])
     VALUES
    (@CompanyID, @IPS_Date, @Branch, @TxnType, @Number, @User, @[Subledger_acc, @sup_name, @Amount,@ledger_Acc,@SupplierReferance,@Reason,@Details)";


                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {

                    con.Close();


                    cmd.Parameters.AddWithValue("@CompanyID", company.Text);
                    cmd.Parameters.AddWithValue("@IPS_Date", date.Text);
                    cmd.Parameters.AddWithValue("@Branch", Branch.Text);
                    cmd.Parameters.AddWithValue("@TxnType", TxnType.Text);
                    cmd.Parameters.AddWithValue("@Number", Number.Text);
                    cmd.Parameters.AddWithValue("@User", user.Text);
                    cmd.Parameters.AddWithValue("@[Subledger_acc", txtsubledger.Text);
                    cmd.Parameters.AddWithValue("@sup_name", txtsup.Text);
                    cmd.Parameters.AddWithValue("@Amount", txtamount.Text);
                    cmd.Parameters.AddWithValue("@ledger_Acc", txtledgeracc.Text);
                    cmd.Parameters.AddWithValue("@SupplierReferance", txtreferance.Text);
                    cmd.Parameters.AddWithValue("@Reason", txtreason.Text);
                    cmd.Parameters.AddWithValue("@Details", txtdetail.Text);



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

        protected void btnprint_Click(object sender, EventArgs e)
        {

        }

        protected void company_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Country_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Branch_TextChanged(object sender, EventArgs e)
        {

        }
    }
}