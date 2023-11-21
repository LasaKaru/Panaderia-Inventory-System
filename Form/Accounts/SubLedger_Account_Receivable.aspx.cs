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

namespace Panaderia.Form.Accounts
{
    public partial class SubLedger_Account_Receivable : System.Web.UI.Page
    {
        private PdfReader writer;
        private DateTime startdate;
        private DateTime enddate;
        private PdfFont font;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // You can call this method after binding data to GridView2
                CustomizeGridViewColumns(GridView2, columnDisplayNames);
            }
        }

        private void CustomizeGridViewColumns(GridView gridView, Dictionary<string, string> columnDisplayNames)
        {
            foreach (DataControlField field in gridView.Columns)
            {
                if (field is BoundField boundField)
                {
                    if (columnDisplayNames.ContainsKey(boundField.DataField))
                    {
                        boundField.HeaderText = columnDisplayNames[boundField.DataField];
                    }
                }
            }
        }

        private Dictionary<string, string> columnDisplayNames = new Dictionary<string, string>
        {
            { "Txn_Id", "Transaction ID" },
            { "Company_ID", "Company ID" },
            {"Branch_Id", "Branch ID" },
            {"Txn_Type", "Transaction Type" },
            { "Txn_Number", "Transaction Number" },
            {"Txn_Date", "Transaction Date" },
            { "Item_No", "Item Number" },
            {"Batch_No", "Batch Number" },
           






          // Add more mappings as needed for other columns
        };


        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            // Implement the logic to generate the report based on the selected criteria

            DateTime startDate = DateTime.Now;
            DateTime endDate = DateTime.Now;


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


                if (DateTime.TryParse(txtStartDate1.Text, out startDate) && DateTime.TryParse(txtEndDate2.Text, out endDate))
                {

                    GeneratePDFReport(dataTable, startDate, endDate);
                    GenerateXLSMReport(dataTable);
                    // Generate reports
                    // Obtain the selected startDate and endDate based on your criteria
                    //DateTime startDate =  DateTime.Now;
                    //DateTime endDate = DateTime.Now;

                    // Generate reports and pass startDate and endDate
                    GeneratePDFReport(dataTable, startDate, endDate);

                    // GeneratePDFReport(dataTable );
                    //GeneratePDFReport(dataTable);
                    GenerateXLSMReport(dataTable);


                    // Email the reports
                    SendEmailWithAttachments();
                }
            }
        }

        //private void GeneratePDFReport(DataTable dataTable)




        // Define a dictionary to map column names to display names




        private void GeneratePDFReport(DataTable dataTable, DateTime startDate, DateTime endDate) //for get date on report

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
                        image.SetWidth(50); // Set the image width to 100 pixels
                        image.SetMarginLeft(1); // Set the left margin to 10 pixels
                        image.SetMarginBottom(1); // Set the bottom margin to 10 pixels
                        document.Add(image);

                        // Add the title
                        Paragraph title = new Paragraph("Panaderia Inventory System")
                            .SetTextAlignment(TextAlignment.CENTER)
                            .SetFontSize(13);
                        document.Add(title);


                        Paragraph title1 = new Paragraph("Sales Report")
                            .SetTextAlignment(TextAlignment.CENTER)
                            .SetFontSize(9);
                        document.Add(title1);

                        // Add Date From and Date To text
                        string dateRangeText = $"Date From: {startDate:dd/MM/yyyy} To: {endDate:dd/MM/yyyy}";
                        Paragraph dateRange = new Paragraph(dateRangeText)
                           .SetTextAlignment(TextAlignment.CENTER)
                            .SetFontSize(9);
                        document.Add(dateRange);


                        // Define the font size
                        // Change this value to your desired font size
                        // Add content to the document based on your dataTable
                        // Add a table for data from the database
                        float tableHeaderFontSize = 10;
                        float coloumDisplayNamesFontSize = 10;
                        float tableDataFontSize = 10;
                        Table table = new Table(dataTable.Columns.Count);
                        table.SetWidth(UnitValue.CreatePercentValue(100));

                        //specify the font name
                        string fontName = "Helvetica";

                        PdfFont font = PdfFontFactory.CreateFont(fontName);

                        foreach (DataColumn column in dataTable.Columns)
                        {
                            string columnDisplayName;
                            if (columnDisplayNames.ContainsKey(column.ColumnName))
                            {
                                columnDisplayName = columnDisplayNames[column.ColumnName];
                            }
                            else
                            {
                                // If there's no mapping, use the column name as the display name
                                columnDisplayName = column.ColumnName;
                            }

                            Cell headerCell = new Cell().Add(new Paragraph(columnDisplayName));
                            headerCell.SetFontSize(12); // Set the font size for headers
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
                File.WriteAllBytes(Server.MapPath("~/Reports/SalesReport.pdf"), stream.ToArray());
            }
        }

        protected void btnDownloadPDF_Click(object sender, EventArgs e)
        {
            string filePath = Server.MapPath("~/Reports/SalesReport.pdf");
            FileInfo file = new FileInfo(filePath);

            if (file.Exists)
            {
                Response.Clear();
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-disposition", "attachment; filename=SalesReport.pdf");
                Response.WriteFile(filePath);
                Response.End();
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
                worksheet.Cell("A1").Value = "Sales Report";
                for (int i = 0; i < dataTable.Rows.Count; i++)
                {
                    for (int j = 0; j < dataTable.Columns.Count; j++)
                    {
                        //worksheet.Cell(i + 2, j + 1).Value = (XLCellValue)dataTable.Rows[i][j];
                    }
                }
                // Save the XLSM file to a location or send it as needed
                workbook.SaveAs(Server.MapPath("~/Reports/SalesReport.xlsm"));
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


        protected void Button1_Click(object sender, EventArgs e)
        {
            // Handle the button click event for Button1
            // Dynamically change the column headers and add columns to GridView2
            GridView2.Columns.Clear(); // Clear existing columns

            // Add columns to GridView2 for Button1
            BoundField Txn_IdColumn = new BoundField();
            Txn_IdColumn.HeaderText = "Transactions Id";
            Txn_IdColumn.DataField = "Txn_Id";
            GridView2.Columns.Add(Txn_IdColumn);

            //BoundField txnTypeColumn = new BoundField();
            //txnTypeColumn.HeaderText = "Transaction Type";
            // txnTypeColumn.DataField = "txn_type";
            // GridView2.Columns.Add(txnTypeColumn);

            // Perform data binding for GridView2 based on the new columns
            GridView2.DataSource = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=MyBooks;Integrated Security=True";
            GridView2.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            // Handle the button click event for Button2
            // Dynamically change the column headers and add columns to GridView2
            GridView2.Columns.Clear(); // Clear existing columns

            // Add columns to GridView2 for Button2
            BoundField customColumn = new BoundField();
            customColumn.HeaderText = "Custom Header";
            customColumn.DataField = "custom_field";
            GridView2.Columns.Add(customColumn);

            // Perform data binding for GridView2 based on the new columns
            GridView2.DataSource = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=MyBooks;Integrated Security=True";
            GridView2.DataBind();
        }

        
    }
}