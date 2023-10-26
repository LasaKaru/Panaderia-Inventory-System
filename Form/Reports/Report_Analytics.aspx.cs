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
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using ClosedXML.Excel;
using iText.Kernel.Events;
using iText.IO.Image;
using iText.Layout.Properties;
using Table = iText.Layout.Element.Table;
using iText.Kernel.Geom;
using iText.Kernel.Font;
using iText.IO.Font;

namespace Panaderia.Form.Reports
{
    public partial class Report_Analytics : System.Web.UI.Page
    {

        private PdfReader writer;
        private DateTime startdate;
        private DateTime enddate;
        private PdfFont font;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
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

                // Call JavaScript function to show the Download button
                ClientScript.RegisterStartupScript(this.GetType(), "ShowDownloadButton", "showDownloadButton();", true);

                // Generate reports
                // Obtain the selected startDate and endDate based on your criteria
                //DateTime startDate =  startdate;
                //DateTime endDate =  enddate;

                // Generate reports and pass startDate and endDate
                //GeneratePDFReport(dataTable, startDate, endDate);

                // GeneratePDFReport(dataTable );
                GeneratePDFReport(dataTable);
                GenerateXLSMReport(dataTable);


                // Email the reports
                SendEmailWithAttachments();
            }
        }

        private void GeneratePDFReport(DataTable dataTable)
        //private void GeneratePDFReport(DataTable dataTable, DateTime startDate, DateTime endDate)

        {
            using (var stream = new MemoryStream())
            {
                using (var writer = new PdfWriter(stream))
                {
                    using (var pdf = new PdfDocument(writer))
                    {
                        var document = new Document(pdf);

                        // Set the page orientation to landscape
                        PageSize pageSize = PageSize.A4.Rotate(); // Landscape orientation
                        pdf.SetDefaultPageSize(pageSize);

                        // Add the image to the first page
                        iText.Layout.Element.Image image = new iText.Layout.Element.Image(ImageDataFactory.Create("https://github.com/LasaKaru/Utility-Inquiry-System/blob/main/cargills-removebg-preview.png?raw=true"));
                        image.SetWidth(100); // Set the image width to 100 pixels
                        image.SetMarginLeft(5); // Set the left margin to 10 pixels
                        image.SetMarginBottom(5); // Set the bottom margin to 10 pixels
                        document.Add(image);

                        // Add the title
                        Paragraph title = new Paragraph("Panaderia Inventory System")
                            .SetTextAlignment(TextAlignment.CENTER)
                            .SetFontSize(16);
                        document.Add(title);


                        Paragraph title1 = new Paragraph("Sales Report")
                            .SetTextAlignment(TextAlignment.CENTER)
                            .SetFontSize(12);
                        document.Add(title1);

                        // Add Date From and Date To text
                        //string dateRangeText = $"Date From: {startDate.ToString("dd/MM/yyyy")} To: {endDate.ToString("dd/MM/yyyy")}";
                        // Paragraph dateRange = new Paragraph(dateRangeText)
                        //    .SetTextAlignment(TextAlignment.CENTER)
                        //     .SetFontSize(12);
                        // document.Add(dateRange);



                        // Add content to the document based on your dataTable
                        // Add a table for data from the database
                        float tableHeaderFontSize = 10;
                        float tableDataFontSize = 10;
                        Table table = new Table(dataTable.Columns.Count);
                        table.SetWidth(UnitValue.CreatePercentValue(100));

                        //specify the font name
                        string fontName = "Helvetica";

                        PdfFont font = PdfFontFactory.CreateFont(fontName);

                        foreach (DataColumn column in dataTable.Columns)
                        {
                            Cell headerCell = new Cell().Add(new Paragraph(column.ColumnName));

                            // Check specific column names and apply a different font size
                            if (column.ColumnName == "Txn_ID" || column.ColumnName == "Company_ID" || column.ColumnName == "Branch_id")
                            {
                                headerCell.SetFontSize(tableHeaderFontSize);
                            }
                            else
                            {
                                headerCell.SetFontSize(tableDataFontSize);
                            }

                            table.AddHeaderCell(headerCell);
                        }

                        //foreach (DataColumn column in dataTable.Columns)
                        //  {
                        //     table.AddHeaderCell(column.ColumnName);
                        // }

                        foreach (DataRow row in dataTable.Rows)
                        {
                            foreach (var item in row.ItemArray)
                            {
                                if (font != null)
                                {
                                    // Create a cell with the specified font
                                    Cell cell = new Cell().Add(new Paragraph(item.ToString()).SetFont(font).SetFontSize(tableDataFontSize));
                                    table.AddCell(cell);
                                }
                            }
                        }

                        document.Add(table);
                        // Example:
                        // document.Add(new Paragraph("Transaction Report"));
                        // foreach (DataRow row in dataTable.Rows)
                        // {
                        //     document.Add(new Paragraph(row["ColumnName"].ToString()));
                        // }
                    }
                }

                // Save the PDF file to a location or send it as needed
                File.WriteAllBytes(Server.MapPath("~/Reports/AnalyticsReport.pdf"), stream.ToArray());
            }
        }

        protected void btnDownloadPDF_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/Reports/AnalyticsReport.pdf");
            FileInfo file = new FileInfo(filePath);

            if (file.Exists)
            {
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment; filename=AnalyticsReport.pdf");
                Response.WriteFile(filePath);
                Response.End();
            }
        }

        //private GeneratePDFReport(DataTable dataTable)
        //{
        // Generate a PDF report using iTextSharp
        // You need to adjust this code based on your actual data and report structure
        // using (var stream = new MemoryStream())
        //  {
        //      using (var writer = new PdfWriter(stream))
        //    {
        //       using (var pdf = new PdfDocument(writer))
        //       {
        //         var document = new Document(pdf);
        // Add content to the document based on your dataTable
        // Example:
        //         document.Add(new Paragraph("Transaction Report"));
        //       foreach (DataRow row in dataTable.Rows)
        //        {
        //          document.Add(new Paragraph(row["ColumnName"].ToString()));
        //       }
        //   }
        // }

        // Save the PDF file to a location or send it as needed
        //    File.WriteAllBytes(Server.MapPath("~/Reports/TransactionReport.pdf"), stream.ToArray());
        //  }
        //}

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

            // Capture relevant data
            int userId = GetUserId(); // Replace with code to get the user's ID
            int productId = GetProductId(); // Replace with code to get the product's ID if applicable
            string reportType = "Sales Report"; // Update with the appropriate report type
            DateTime downloadDate = DateTime.Now;
            bool printed = false; // Initially set to false since it's a download event

            // Insert download event into the database
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True"; // Update with your actual connection string
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand())
                {
                    command.Connection = connection;
                    command.CommandText = "INSERT INTO Report_DownloadHistory (UserId, ProductId, ReportType, DownloadedDate, Printed) " +
                        "VALUES (@UserId, @ProductId, @ReportType, @DownloadedDate, @Printed)";

                    command.Parameters.AddWithValue("@UserId", userId);
                    command.Parameters.AddWithValue("@ProductId", productId);
                    command.Parameters.AddWithValue("@ReportType", reportType);
                    command.Parameters.AddWithValue("@DownloadedDate", downloadDate);
                    command.Parameters.AddWithValue("@Printed", printed);

                    command.ExecuteNonQuery();
                }
            }
        }

        private int GetProductId()
        {
            if (HttpContext.Current.Session["ValidUsername"] != null)
            {
                // Parse the user's ID from the session variable (assuming it's an integer)
                int userId;
                if (int.TryParse(HttpContext.Current.Session["ValidUsername"].ToString(), out userId))
                {
                    return userId;
                }
            }
            // Handle cases where the user's ID cannot be obtained
            return -1;

        }

        private int GetUserId()
        {
            // Replace this logic with code to fetch the product's ID
            // This is a sample logic; you should adapt it to your database structure.
            int productId = -1; // Default value in case product ID retrieval fails

            // Assuming the product ID is provided in a query parameter (e.g., ?productId=123)
            if (Request.QueryString["productId"] != null)
            {
                if (int.TryParse(Request.QueryString["productId"], out productId))
                {
                    return productId;
                }
            }

            return productId;
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



        private void GenerateXLSMReport(DataTable dataTable)
        {
            // Generate an XLSM report using ClosedXML
            // You need to adjust this code based on your actual data and report structure
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("Sheet1");
                // Add content to the worksheet based on your dataTable
                // Example:
                worksheet.Cell("A1").Value = "Analytics Report";
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    for (int j = 0; j < dataTable.Columns.Count; j++)
                    {
                        // worksheet.Cell(i + 2, j + 1).Value = (XLCellValue)dataTable.Rows[i][j];
                    }
                }
                // Save the XLSM file to a location or send it as needed
                workbook.SaveAs(Server.MapPath("~/Reports/AnalyticsReport.xlsm"));
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

        private void SendEmailWithAttachments(DataTable dataTable)
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

    }  
}