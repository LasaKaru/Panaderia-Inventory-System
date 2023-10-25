using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using Microsoft.Reporting.WinForms;


namespace Panaderia.Form.Views
{
    public partial class Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Add any initialization logic here
            }

        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            if (sender == Button1)
            {
                LoadInventoryBalance();
            }
            else if (sender == Button2)
            {
                // Handle print logic (if needed)
                // This can be a placeholder for generating a printable view of the inventory
            }

        }

        private void LoadInventoryBalance()
        {
            // Implement the logic to load inventory balance based on the selected date
            DateTime asAtDate = DateTime.Parse(txtStartDate1.Text);

            // Use the connection string and SQL query based on your actual database structure
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=MyBooks;Integrated Security=True";
            string query = "SELECT * FROM dbo.TX_Inventory WHERE Txn_Date <= @AsAtDate";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@AsAtDate", asAtDate);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);

                    // Bind the data to the GridView
                    GridView.DataSource = dataTable;
                    GridView.DataBind();
                }
            }
        }



        protected void btnGenerateReport1_Click(object sender, EventArgs e)
        {
            if (sender == Button1)
            {
                LoadInventoryBalance();
            }
            else if (sender == Button2)
            {
                // Handle print logic
                PrintInventory();
            }
        }

        private void PrintInventory()
        {
            // Generate a printable version of the GridView and open it in a new window
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);

            GridView.AllowPaging = false; // Disable paging for the printable version
            GridView.RenderControl(hw);

            string gridHTML = sw.ToString();
            gridHTML = "<html><body>" + gridHTML + "</body></html>";

            // Add any additional styles or formatting if needed

            // RegisterStartupScript to open a new window with the printable content
            Page.ClientScript.RegisterStartupScript(GetType(), "Print", "window.open('','_blank').document.write('" + gridHTML + "'); window.print();", true);
        }


        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {
            // Assuming txtStartDate is a TextBox with TextMode="Date"
            DateTime startDate;

            if (DateTime.TryParse(txtStartDate1.Text, out startDate))
            {
                // Successfully parsed the entered date
                // Perform any actions you need with the parsed date

                // Example: Display a message with the selected date
                lblMessage.Text = $"Selected Date: {startDate.ToShortDateString()}";
            }
            else
            {
                // Invalid date format entered
                // You can provide feedback to the user or handle it as needed

                // Example: Display an error message
                lblMessage.Text = "Invalid date format. Please enter a valid date.";
            }

        }
    }
}