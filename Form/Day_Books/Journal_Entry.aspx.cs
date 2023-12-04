using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Panaderia.Form.Day_Books
{
    public partial class Journal_Entry : System.Web.UI.Page
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
                LoadItemData();
            }
        }

            private void LoadUserData() { }

            private void LoadItemData()
            {
                string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
                string query = "SELECT Acc_No,Acc_Code,Acc_Description,Acc_Impact FROM [MyBooks].[dbo].[ACC_Template]";

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
    }
}