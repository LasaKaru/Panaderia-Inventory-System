﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.IO;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using ClosedXML.Excel;

namespace Panaderia.Form.Reports
{
    public partial class Report_Purchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This method is called when the page is loaded
            // You can perform initialization tasks here

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


            DataTable dataTable = new DataTable();
            // Implement the logic to generate the report based on the selected criteria
            if (sender == Button1)
            {
                GenerateTransactionReport(ref dataTable);
            }
            else if (sender == Button2)
            {
                GenerateItemsReport(ref dataTable);
            }
            else if (sender == Button6)
            {
                GenerateSalesReturnReport(ref dataTable);
            }

            if (dataTable != null)
            {
                // Bind the data to the GridView2
                GridView2.DataSource = dataTable;
                GridView2.DataBind();

                // Generate reports
                GeneratePDFReport(dataTable);
                GenerateXLSMReport(dataTable);


                // Email the reports
                SendEmailWithAttachments();
            }


        }

        private void GenerateSalesReturnReport(ref DataTable dataTable)
        {
            // Implement the logic to generate the sales/return report
            // use txtStartDate1.Text and txtEndDate2.Text to get the selected date range
            // Example:
            DateTime startDate = DateTime.Parse(txtStartDate1.Text);
            DateTime endDate = DateTime.Parse(txtEndDate2.Text);

            // Use the connection string and SQL query based on your actual database structure
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=MyBooks;Integrated Security=True";
            string query = "SELECT * FROM dbo.TX_Inventory WHERE Txn_Date BETWEEN @StartDate AND @EndDate";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters and set their values based on the date range
                    // Example:
                    command.Parameters.AddWithValue("@StartDate", startDate);
                    command.Parameters.AddWithValue("@EndDate", endDate);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    //DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);

                    // Use the dataTable to bind data to your report or display it as needed
                    // Bind the data to the GridView2
                    GridView2.DataSource = dataTable;
                    GridView2.DataBind();
                }
            }
        }


        private void GenerateTransactionReport(ref DataTable dataTable)
        {
            // Implement the logic to generate the transaction report
            // use txtStartDate1.Text and txtEndDate2.Text to get the selected date range
            // Example:
            DateTime startDate = DateTime.Parse(txtStartDate1.Text);
            DateTime endDate = DateTime.Parse(txtEndDate2.Text);

            // Use the connection string and SQL query based on your actual database structure
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=MyBooks;Integrated Security=True";
            string query = "SELECT * FROM dbo.TX_Inventory WHERE Txn_Date BETWEEN @StartDate AND @EndDate";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters and set their values based on the date range
                    // Example:
                    command.Parameters.AddWithValue("@StartDate", startDate);
                    command.Parameters.AddWithValue("@EndDate", endDate);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    // DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);

                    // Use the dataTable to bind data to your report or display it as needed
                    // Bind the data to the GridView2
                    GridView2.DataSource = dataTable;
                    GridView2.DataBind();

                    // Send the report as an attachment via email
                    SendEmailWithAttachment(dataTable);
                }
            }
        }

        private void SendEmailWithAttachment(DataTable dataTable)
        {
            try
            {
                // Set your SMTP server details
                SmtpClient smtpClient = new SmtpClient("your_smtp_server");
                smtpClient.Port = 587;
                smtpClient.Credentials = new NetworkCredential("your_email@example.com", "your_email_password");
                smtpClient.EnableSsl = true;

                // Create the email message
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("your_email@example.com");
                mailMessage.To.Add("recipient@example.com");
                mailMessage.Subject = "Generated Report";

                // Convert DataTable to CSV and attach it to the email
                //string csvData = ConvertDataTableToCsv(dataTable);
                //Attachment attachment = new Attachment(new System.IO.MemoryStream(System.Text.Encoding.UTF8.GetBytes(csvData)), "report.csv");
                // mailMessage.Attachments.Add(attachment);

                // Send the email
                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                // Handle exceptions or log errors as needed
                Response.Write("Error sending email: " + ex.Message);
            }
        }


        private void GenerateItemsReport(ref DataTable dataTable)
        {
            // Implement the logic to generate the items report
            // use txtStartDate1.Text and txtEndDate2.Text to get the selected date range
            // Example:
            DateTime startDate = DateTime.Parse(txtStartDate1.Text);
            DateTime endDate = DateTime.Parse(txtEndDate2.Text);

            // Use the connection string and SQL query based on your actual database structure
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=MyBooks;Integrated Security=True";
            string query = "SELECT * FROM dbo.TX_Inventory WHERE Txn_Date BETWEEN @StartDate AND @EndDate";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters and set their values based on the date range
                    // Example:
                    command.Parameters.AddWithValue("@StartDate", startDate);
                    command.Parameters.AddWithValue("@EndDate", endDate);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    // DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);

                    // Use the dataTable to bind data to your report or display it as needed
                    // Bind the data to the GridView2
                    GridView2.DataSource = dataTable;
                    GridView2.DataBind();
                }
            }
        }

        private void GeneratePDFReport(DataTable dataTable)
        {

        }

        private void GenerateXLSMReport(DataTable dataTable)
        {
            // Generate an XLSM report using ClosedXML
            // You need to adjust this code based on your actual data and report structure
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Sheet1");
                // Add content to the worksheet based on your dataTable
                // Example:
                worksheet.Cell("A1").Value = "Transaction Report";
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    for (int j = 0; j < dataTable.Columns.Count; j++)
                    {
                        // worksheet.Cell(i + 2, j + 1).Value = (XLCellValue)dataTable.Rows[i][j];
                    }
                }
                // Save the XLSM file to a location or send it as needed
                workbook.SaveAs(Server.MapPath("~/Reports/TransactionReport.xlsm"));
            }
        }


        private void SendEmailWithAttachments()
        {
            try
            {
                // Set your SMTP server details
                SmtpClient smtpClient = new SmtpClient("your_smtp_server");
                smtpClient.Port = 587;
                smtpClient.Credentials = new NetworkCredential("your_email@example.com", "your_email_password");
                smtpClient.EnableSsl = true;

                // Create the email message
                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("your_email@example.com");
                mailMessage.To.Add("recipient@example.com");
                mailMessage.Subject = "Generated Report";

                // Convert DataTable to CSV and attach it to the email
                //string csvData = ConvertDataTableToCsv(dataTable);
                //Attachment attachment = new Attachment(new System.IO.MemoryStream(System.Text.Encoding.UTF8.GetBytes(csvData)), "report.csv");
                // mailMessage.Attachments.Add(attachment);

                // Send the email
                smtpClient.Send(mailMessage);
            }
            catch (Exception ex)
            {
                // Handle exceptions or log errors as needed
                Response.Write("Error sending email: " + ex.Message);
            }
        }


        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {

        }

        // Placeholder for fetching data and generating the report (commented for now)
        /*
        private string GenerateReportData()
        {
            // Fetch data based on the date range and report type
            // ...

            // Return the report data
            return "YourGeneratedReportData";
        }

        private void DisplayReport(string reportData)
        {
            // Display the generated report on the page
            // ...
        }
        */
    }
}