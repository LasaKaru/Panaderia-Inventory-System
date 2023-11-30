using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
//using Panaderia.DataAccessLayer;

namespace Panaderia.Form.Inventory
{
    public partial class Adjustment_Excess : System.Web.UI.Page
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
              //  LoadData();
            }
        }

        private void LoadUserData() { }

        /*
        private void LoadData()
        {
            try
            {
                clsCOMMON obj_ = new clsCOMMON();

                obj_.EMPID = "";

                DataTable dt = obj_.GetreturncreditData(obj_).Tables[0];


                String companyID = dt.Rows[0][0].ToString();
                String strbranch = dt.Rows[0][1].ToString();
                String txn = dt.Rows[0][2].ToString();
                //String num = dt.Rows[0][3].ToString();

                company.Text = companyID;
                Branch.Text = strbranch;
                TxnType.Text = txn;
                // Number.Text = num;
            }
            catch (Exception excLSK)
            {

                throw;
            }

        }

        */

        protected void company_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click1(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string insertQuery = @"INSERT INTO [dbo].[Inv_adjustments]
           ([CompanyID],[IPS_Date],[Branch],[TxnType],[Number],[User],[ref_nu],[Comments])
     VALUES
                   (@CompanyID, @IPS_Date, @Branch, @TxnType, @Number, @User,  @ref_nu, @Comments)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {
                    // No need to close the connection before opening it

                    cmd.Parameters.AddWithValue("@CompanyID", company.Text);
                    cmd.Parameters.AddWithValue("@IPS_Date", date.Text);
                    cmd.Parameters.AddWithValue("@Branch", Branch.Text);
                    cmd.Parameters.AddWithValue("@TxnType", TxnType.Text);
                    cmd.Parameters.AddWithValue("@Number", Number.Text);
                    cmd.Parameters.AddWithValue("@User", user.Text);
                    cmd.Parameters.AddWithValue("@ref_nu", txtReferanceNo.Text);
                    cmd.Parameters.AddWithValue("@Comments", txtComments.Text);



                    con.Open();
                    cmd.ExecuteNonQuery();

                    // Response.Write("Saved Successfully");
                    divMsg.Visible = true;
                    lblShowMessage.Visible = true;
                    lblShowMessage.Text = "Successfully inserted!";
                }
            }

        }
    }
}