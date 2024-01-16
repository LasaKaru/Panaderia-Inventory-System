using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using Panaderia.DataAccessLayer;
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
using iText.Layout.Borders;
using iText.Kernel.Colors;
using iText.Kernel.Pdf.Canvas.Draw;

namespace Panaderia.Form.Day_Books
{
    public partial class CashBook_Receipt : System.Web.UI.Page
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
                LoadsourceData();
            }
            {
                LoadledgerData();
            }
            {
                LoadsubledgerData();
            }

        }

        private void LoadUserData() { }
        private void LoadsourceData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT Acc_Code,Acc_Description,Acc_Type,Acc_SubType,Acc_Impact FROM [MyBooks].[dbo].[ACC_Template]";

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
        private void LoadledgerData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT Acc_Code,Acc_Description,Acc_Type,Acc_SubType,Acc_Impact FROM [MyBooks].[dbo].[ACC_Template]";

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
        private void LoadsubledgerData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "  SELECT Acc_No,CUS_CODE,CUS_NAME,TEL1,CUS_HOLD FROM [MyBooks].[dbo].[MF_Customer]";

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


        protected void btnSave_Click(object sender, EventArgs e)
        {

            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string insertQuery = @"INSERT INTO [dbo].[day_books]
           ([CompanyID],[IPS_Date],[Branch],[TxnType],[Number],[User],[sourceACC],[ledgerAcc],[subledgerAcc],[name],[amount],[adjustments]
           ,[netAmount],[referance],[reason],[deatils])
     VALUES
    (@CompanyID, @IPS_Date, @Branch, @TxnType, @Number, @User, @sourceACC, @ledgerAcc, @subledgerAcc, @name,@amount,@adjustments,@netAmount,@referance,@reason,@deatils)";


                using (SqlCommand cmd = new SqlCommand(insertQuery, con))
                {

                    con.Close();


                    cmd.Parameters.AddWithValue("@CompanyID", company.Text);
                    cmd.Parameters.AddWithValue("@IPS_Date", date.Text);
                    cmd.Parameters.AddWithValue("@Branch", Branch.Text);
                    cmd.Parameters.AddWithValue("@TxnType", TxnType.Text);
                    cmd.Parameters.AddWithValue("@Number", Number.Text);
                    cmd.Parameters.AddWithValue("@User", user.Text);
                    cmd.Parameters.AddWithValue("@sourceACC", txtSourceAcc.Text);
                    cmd.Parameters.AddWithValue("@ledgerAcc", txtLedgerAcc.Text);
                    cmd.Parameters.AddWithValue("@subledgerAcc", txtSubLedgerAcc.Text);
                    cmd.Parameters.AddWithValue("@name", txtdaybook.Text);
                    cmd.Parameters.AddWithValue("@amount", txtamount.Text);
                    cmd.Parameters.AddWithValue("@adjustments", txtAdjustment.Text);
                    cmd.Parameters.AddWithValue("@netAmount", txtNetamount.Text);
                    cmd.Parameters.AddWithValue("@referance", txtreferance.Text);
                    cmd.Parameters.AddWithValue("@reason", txtreason.Text);
                    cmd.Parameters.AddWithValue("@deatils", txtdetail.Text);


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


        /*
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            // Retrieve the DataTable from the session
            DataTable dt = (DataTable)Session["data"];

            // Create a MemoryStream to store the PDF
            using (MemoryStream stream = new MemoryStream())
            {
                // Create a PdfWriter
                using (PdfWriter writer = new PdfWriter(stream))
                {
                    // Create a PdfDocument
                    using (PdfDocument pdf = new PdfDocument(writer))
                    {
                        // Create a Document
                        using (Document document = new Document(pdf))
                        {
                            // Set the page orientation to landscape
                            PageSize pageSize = PageSize.A4; // Landscape orientation
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

                            Paragraph title1 = new Paragraph("Purchase Order Report\n \n ")
                            .SetTextAlignment(TextAlignment.CENTER)
                            .SetFontSize(9);
                            document.Add(title1);

                            // Get the current date for billing
                            DateTime billingDate = DateTime.Now;

                            // Add the billing date
                            //Paragraph billingDateParagraph = new Paragraph($"Billing Date: {billingDate:dd/MM/yyyy}")
                            //    .SetTextAlignment(TextAlignment.CENTER)
                            //    .SetFontSize(9);
                            // document.Add(billingDateParagraph);



                            // Add company information
                            Paragraph companyInfo = new Paragraph("Company Name: Panaderia Bakery and Foods Products\nAddress: Colombo 01\nTelephone: 011-2221222\nFax: 0113363363 \n \n ")
                                .SetTextAlignment(TextAlignment.LEFT)
                                .SetFontSize(9);
                            document.Add(companyInfo);

                            // Get the supplier information from TextBox controls
                            //string supplierName = txtsupplier.Text;
                            //string supplierId = txtsupid.Text;
                            //string supplier = txtsup.Text;

                            // Get the current date, time, and user who logged in
                            DateTime currentDate = DateTime.Now;
                            string currentUser = HttpContext.Current.User.Identity.Name;

                            // Add purchase order information
                            Paragraph poInfo = new Paragraph($"Bill Date: {currentDate:dd/MM/yyyy HH:mm:ss}\nUser: {currentUser}\nSupplier ID: \nSupplier Name: \n \n")
                                .SetTextAlignment(TextAlignment.LEFT)
                                .SetFontSize(9);
                            document.Add(poInfo);

                            // Create a table with specific columns
                            Table table = new Table(new float[] { 70f, 120f, 55f, 45f, 45f, 45f, 60f, 70f }) // Manually set widths
                            .SetBorder(Border.NO_BORDER) // Remove default table border
                            .SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 1f)) // Set a light gray border color
                            .SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 1f)); // Set a light gray right border

                            // Add headers to the table
                            table.AddHeaderCell(new Cell().Add("Item Code").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                            table.AddHeaderCell(new Cell().Add("Description").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                            table.AddHeaderCell(new Cell().Add("Price").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                            table.AddHeaderCell(new Cell().Add("Psize").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                            table.AddHeaderCell(new Cell().Add("Packs").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                            table.AddHeaderCell(new Cell().Add("Nos").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                            table.AddHeaderCell(new Cell().Add("Discount %").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                            table.AddHeaderCell(new Cell().Add("Amount").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));


                            // Add rows to the table
                            foreach (DataRow row in dt.Rows)
                            {
                                // Add cells with solid black border
                                table.AddCell(new Cell().Add(row["item_code"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                table.AddCell(new Cell().Add(row["Description"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                table.AddCell(new Cell().Add(Convert.ToDecimal(row["price"]).ToString("F2")).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                table.AddCell(new Cell().Add(row["psize"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                table.AddCell(new Cell().Add(row["packs"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                table.AddCell(new Cell().Add(row["nos"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                table.AddCell(new Cell().Add(row["discount"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                table.AddCell(new Cell().Add(Convert.ToDecimal(row["Amount"]).ToString("F2")).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                            }

                            // Add a footer row with cells spanning the entire width of the table
                            //Cell footerCell = new Cell(1, 8);
                            //footerCell.Add("\n \n \n \n Let's Reduce, Reuse, And Recycle. "); // Add an empty string or any content you want for the footer
                            //table.AddCell(footerCell);


                            // Add space between grand total and GridView
                            document.Add(new Paragraph().SetMargins(0, 0, 0, 50)); // Adjust the bottom margin as needed


                            // Add the table to the document
                            document.Add(table);

                            // Add a line break
                            document.Add(new Paragraph());

                            // Calculate and add the grand total to the PDF
                            decimal grandTotal = 0;
                            foreach (DataRow row in dt.Rows)
                            {
                                grandTotal += Convert.ToDecimal(row["Amount"]);

                            }


                            //document.Add(new Paragraph($"Total Amount: {grandTotal}"));
                            // Add the grand total with adjusted left margin, bold, and left alignment
                            Paragraph grandTotalParagraph = new Paragraph($"\n \n Total Amount: {grandTotal:F2}")
                                .SetTextAlignment(TextAlignment.LEFT)
                                //.SetBold()
                                //.SetMarginLeft(200f) // Adjust the margin as needed
                                .SetUnderline()
                                //.SetUnderlineThickness(1.5f) // Adjust the thickness as needed
                                .SetMarginLeft(380f) // Adjust the margin as needed
                                .SetBorderBottom(new SolidBorder(ColorConstants.BLACK));
                            document.Add(grandTotalParagraph);

                            // Add space between grand total and GridView
                            document.Add(new Paragraph().SetMargins(0, 0, 0, 3800)); // Adjust the bottom margin as needed



                            // Add the footer line
                            LineSeparator lineSeparator = new LineSeparator(new SolidLine(1f))
                                .SetMarginTop(10) // Adjust the top margin as needed
                                .SetMarginBottom(20); // Adjust the bottom margin as needed
                            document.Add(lineSeparator);

                            // Add space between footer line and GridView
                            document.Add(new Paragraph().SetMargins(0, 0, 0, 20)); // Adjust the bottom margin as needed

                        }

                    }
                }

                // Set the response content type
                Response.ContentType = "application/pdf";

                // Set the content disposition and file name
                Response.AddHeader("Content-Disposition", "attachment; filename=Invoice.pdf");

                // Write the PDF to the response stream
                Response.BinaryWrite(stream.ToArray());

                // End the response
                Response.End();
            }

        }

        */
        protected void btnPrint_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Directly execute a query to get the data you need
                string query = "SELECT * FROM [dbo].[day_books]";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        using (MemoryStream stream = new MemoryStream())
                        {
                            using (PdfWriter writer = new PdfWriter(stream))
                            {
                                using (PdfDocument pdf = new PdfDocument(writer))
                                {
                                    using (Document document = new Document(pdf))
                                    {
                                        // ... (existing code for headers, images, and other static content)

                                        Table table = new Table(new float[] { 70f, 120f, 55f, 45f, 45f, 45f, 60f, 70f })
                                            .SetBorder(Border.NO_BORDER)
                                            .SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 1f))
                                            .SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 1f));

                                        table.AddHeaderCell(new Cell().Add("Item Code").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                                        table.AddHeaderCell(new Cell().Add("Description").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                                        table.AddHeaderCell(new Cell().Add("Price").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                                        table.AddHeaderCell(new Cell().Add("Psize").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                                        table.AddHeaderCell(new Cell().Add("Packs").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                                        table.AddHeaderCell(new Cell().Add("Nos").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                                        table.AddHeaderCell(new Cell().Add("Discount %").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));
                                        table.AddHeaderCell(new Cell().Add("Amount").SetBorderBottom(new SolidBorder(ColorConstants.BLACK)));

                                        while (reader.Read())
                                        {
                                            table.AddCell(new Cell().Add(reader["item_code"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                            table.AddCell(new Cell().Add(reader["Description"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                            table.AddCell(new Cell().Add(Convert.ToDecimal(reader["price"]).ToString("F2")).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                            table.AddCell(new Cell().Add(reader["psize"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                            table.AddCell(new Cell().Add(reader["packs"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                            table.AddCell(new Cell().Add(reader["nos"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                            table.AddCell(new Cell().Add(reader["discount"].ToString()).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                            table.AddCell(new Cell().Add(Convert.ToDecimal(reader["Amount"]).ToString("F2")).SetBorderBottom(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)).SetBorderRight(new SolidBorder(new DeviceRgb(150, 150, 150), 0.5f)));
                                        }

                                        document.Add(table);
                                        // ... (existing code for the footer, grand total, and other static content)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }





        protected void company_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Branch_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Country_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click1(object sender, EventArgs e)
        {


        }
    }
}