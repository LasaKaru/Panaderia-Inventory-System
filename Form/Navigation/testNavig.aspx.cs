using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Panaderia.Form.Navigation
{
    public partial class testNavig : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            // Get the selected dates
            //DateTime startDate = DateTime.Parse(txtStartDate.Text);
            // DateTime endDate = DateTime.Parse(txtEndDate.Text);

            // Database connection and query to fetch data (commented for now)
            /*
            string connectionString = "YourConnectionString";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Your SQL query to fetch data based on the date range
                // ...

                // Process the fetched data and generate the report
                // ...

                connection.Close();
            }
            */

            // Placeholder for report generation logic (commented for now)
            /*
            string reportData = GenerateReportData();
            DisplayReport(reportData);
            */
        }

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {

        }
    }
}