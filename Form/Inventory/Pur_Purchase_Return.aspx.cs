using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
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

namespace Panaderia.Form.Inventory
{
    public partial class Pur_Purchase_Return : System.Web.UI.Page
    {
        DataTable dt;
        Int64 totalprice;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the current date and time from the database or server.
            DateTime dt1 = DateTime.Now;

            // Set the value of the TextBox control.
            date.Text = dt1.ToString("yyyy-MM-dd HH:mm:ss");

            // Get the valid login user name from the default.aspx.cs code btnLogin_Click() function.
            string validUsername = (string)System.Web.HttpContext.Current.Session["ValidUsername"];

            // Set the value of the TextBox control.
            user.Text = validUsername;


            // Load the user data from the database when the page is loaded
            if (!IsPostBack) // Ensure that the code is executed only on the initial page load, not on postbacks
            {
                dt = new DataTable();
                dt.Columns.Add("Line");
                dt.Columns.Add("item_code");
                dt.Columns.Add("Description");
                dt.Columns.Add("price");
                dt.Columns.Add("psize");
                dt.Columns.Add("packs");
                dt.Columns.Add("nos");
                dt.Columns.Add("discount");
                dt.Columns.Add("Amount");
                Session["data"] = dt;
                TextBox1.Text = "1";
            }

            {
                LoadUserData();
            }

            {
                LoadSupData();
            }
            {
                LoadReturnData();

            }
            {
                LoadItemData();
            }

        }

        private void LoadItemData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT item_nu,code,Description,Price,PSize,Pascks,Nos,Dis,Amount,Usize FROM [Panaderia].[dbo].[MF_item_new]";

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


        private void LoadSupData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT Sup_nu,Code,SupplierName,Telephone,ContactPerson1,ContactDetails1,Email FROM [Panaderia].[dbo].[MF_Supplier_new1]";

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
        private void LoadReturnData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT G_NO,Sup_num,code,Sup_Name,InvoiceNo,InvoiceAmount,InvoiceDate,Amount,Adjustments FROM [Panaderia].[dbo].[Inv_Purchase_GoodsReceive]";

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



        protected void btnSave_Click(object sender, EventArgs e)
        {

            try
            {
                // Retrieve the DataTable from the session
                DataTable dt = (DataTable)Session["data"];

                // Calculate and add the grand total to the database
                decimal grandTotal = 0;
                foreach (DataRow row in dt.Rows)
                {
                    grandTotal += Convert.ToDecimal(row["Amount"]);
                }

                // Assuming you have a SqlConnection and other necessary objects for database access
                string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Insert into [dbo].[Inv_Purchase_Order_new]
                    string insertMainQuery = @"INSERT INTO [dbo].[Inv_Purchase_Return]
           ([CompanyID],[IPS_Date],[Branch],[TxnType],[Number],[User],[Sup_nu],[code],[Sup_Name],[Amount],[Adjustments],[NetAmount],[Comments]
           ,[GRNNo],[InvoiceNo],[InvoiceAmount],[InvoiceDate])
     VALUES
                (@CompanyID,@IPS_Date,@Branch,@TxnType, @Number,@User,@Sup_nu, @code,@Sup_Name,@Amount,@Adjustments,@NetAmount,@Comments,@GRNNo,@InvoiceNo,@InvoiceAmount,@InvoiceDate)";

                    using (SqlCommand cmdMain = new SqlCommand(insertMainQuery, connection))
                    {
                        cmdMain.Parameters.AddWithValue("@CompanyID", company.Text);
                        cmdMain.Parameters.AddWithValue("@IPS_Date", date.Text);
                        cmdMain.Parameters.AddWithValue("@Branch", Branch.Text);
                        cmdMain.Parameters.AddWithValue("@TxnType", TxnType.Text);
                        cmdMain.Parameters.AddWithValue("@Number", Number.Text);
                        cmdMain.Parameters.AddWithValue("@User", user.Text);
                        cmdMain.Parameters.AddWithValue("@Sup_nu", txtsupplier.Text);
                        cmdMain.Parameters.AddWithValue("@code", txtsupid.Text);
                        cmdMain.Parameters.AddWithValue("@Sup_Name", txtsup.Text);
                        cmdMain.Parameters.AddWithValue("@Amount", txtamount.Text);
                        cmdMain.Parameters.AddWithValue("@Adjustments", txtadjustment.Text);
                        cmdMain.Parameters.AddWithValue("@NetAmount", txtnetamount.Text);
                        cmdMain.Parameters.AddWithValue("@Comments", txtcomments.Text);
                        cmdMain.Parameters.AddWithValue("@GRNNo", txtGRNno.Text);
                        cmdMain.Parameters.AddWithValue("@InvoiceNo", txtInvoiceNo.Text);
                        cmdMain.Parameters.AddWithValue("@InvoiceAmount", txtGRNamount.Text);
                        cmdMain.Parameters.AddWithValue("@InvoiceDate", txtGRNdate.Text);

                        cmdMain.ExecuteNonQuery();
                    }

                    // Insert into purchase_order_footer
                    foreach (DataRow row in dt.Rows)
                    {
                        string insertDetailQuery = "INSERT INTO purchase_return_footer (ItemCode, Description, Price, PSize, Packs, Nos, Discount, Amount, GrandTotal) " +
                                     "VALUES (@ItemCode, @Description, @Price, @PSize, @Packs, @Nos, @Discount, @Amount, @GrandTotal)";

                        using (SqlCommand command = new SqlCommand(insertDetailQuery, connection))
                        {
                            command.Parameters.AddWithValue("@ItemCode", row["item_code"]);
                            command.Parameters.AddWithValue("@Description", row["Description"]);
                            command.Parameters.AddWithValue("@Price", Convert.ToDecimal(row["price"]));
                            command.Parameters.AddWithValue("@PSize", Convert.ToInt32(row["psize"]));
                            command.Parameters.AddWithValue("@Packs", Convert.ToInt32(row["packs"]));
                            command.Parameters.AddWithValue("@Nos", Convert.ToInt32(row["nos"]));
                            command.Parameters.AddWithValue("@Discount", Convert.ToDecimal(row["discount"]));
                            command.Parameters.AddWithValue("@Amount", Convert.ToDecimal(row["Amount"]));
                            command.Parameters.AddWithValue("@GrandTotal", grandTotal);

                            command.ExecuteNonQuery();
                        }
                    }
                }

                dt.Clear();
                GridView4.DataSource = null;
                GridView4.DataBind();
                Session["data"] = dt;

                divMsg.Visible = true;
                lblShowMessage.Visible = true;
                lblShowMessage.Text = "Successfully inserted!";
            }
            catch (Exception ex)
            {

            }

        }

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

                            Paragraph title1 = new Paragraph("Purchase Return Report\n \n ")
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
                            string supplierName = txtsupplier.Text;
                            string supplierId = txtsupid.Text;
                            string supplier = txtsup.Text;

                            // Get the current date, time, and user who logged in
                            DateTime currentDate = DateTime.Now;
                            string currentUser = HttpContext.Current.User.Identity.Name;

                            // Add purchase order information
                            Paragraph poInfo = new Paragraph($"Bill Date: {currentDate:dd/MM/yyyy HH:mm:ss}\nUser: {currentUser}\nSupplier ID: {supplierId}\nSupplier Name: {supplier}\n \n")
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

        protected void btnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Dashboard.aspx");

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["data"];
            DataRow dr = dt.NewRow();

            // Set values for the new row
            dr["Line"] = TextBox1.Text;
            dr["item_code"] = TextBox2.Text;
            dr["Description"] = TextBox4.Text;
            dr["price"] = TextBox5.Text;
            dr["psize"] = TextBox6.Text;
            dr["packs"] = TextBox7.Text;
            dr["nos"] = TextBox8.Text;

            // Check if a discount is entered
            if (!string.IsNullOrEmpty(TextBox9.Text))
            {
                int discount = Convert.ToInt32(TextBox9.Text);
                dr["discount"] = discount.ToString(); // Set the discount value in the "discount" column
            }

            // Calculate total price
            totalprice = Convert.ToInt64(TextBox8.Text) * Convert.ToInt64(TextBox5.Text);

            // Apply the discount to totalprice if applicable
            if (!string.IsNullOrEmpty(TextBox9.Text))
            {
                int discount = Convert.ToInt32(TextBox9.Text);
                totalprice -= (totalprice * discount) / 100;
            }

            dr["Amount"] = totalprice.ToString();

            // Add the row to the DataTable
            dt.Rows.Add(dr);

            // Update GridView and session
            GridView4.DataSource = dt;
            GridView4.DataBind();
            Session["buyitems"] = dt;

            // Reset input fields and recalculate sum
            TextBox1.Text = (dt.Rows.Count + 1).ToString();
            TextBox3.Text = "";
            TextBox2.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = ""; // Clear discount TextBox
            calculateSum();
        }
        private void calculateSum()
        {
            Int32 grandtotal = 0;
            foreach (GridViewRow row in GridView4.Rows)
            {

                grandtotal = grandtotal + Convert.ToInt32(row.Cells[9].Text); //Where Cells is the column. Just changed the index of cells
            }
            GridView4.FooterRow.Cells[7].Text = "<b>Total Amount</b>";
            GridView4.FooterRow.Cells[7].Font.Bold = true;
            GridView4.FooterRow.Cells[8].Text = "<b> =</b>";
            GridView4.FooterRow.Cells[8].Font.Bold = true;
            GridView4.FooterRow.Cells[9].Text = grandtotal.ToString();
            GridView4.FooterRow.Cells[9].Font.Bold = true;
            // Label1.Text = "Price(in Words) " + ConvertNumbertoWords(grandtotal);

            // Set the total amount in the txtamount TextBox
            txtamount.Text = grandtotal.ToString();

        }
        /*public static string ConvertNumbertoWords(int number)
          {
              if (number == 0)
                  return "ZERO";
              if (number < 0)
                  return "minus " + ConvertNumbertoWords(Math.Abs(number));
              string words = "";
              if ((number / 100000) > 0)
              {
                  words += ConvertNumbertoWords(number / 100000) + " Lacs ";
                  number %= 100000;
              }
              if ((number / 1000) > 0)
              {
                  words += ConvertNumbertoWords(number / 1000) + " Thousand ";
                  number %= 1000;
              }
              if ((number / 100) > 0)
              {
                  words += ConvertNumbertoWords(number / 100) + " Hundred ";
                  number %= 100;
              }
              if (number > 0)
              {
                  if (words != "")
                      words += "AND ";
                  var unitsMap = new[] { "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
                  var tensMap = new[] { "Zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };

                  if (number < 20)
                      words += unitsMap[number];
                  else
                  {
                      words += tensMap[number / 10];
                      if ((number % 10) > 0)
                          words += " " + unitsMap[number % 10];
                  }
              }
              return words;
          }*/
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the index of the row being deleted
            int rowIndex = e.RowIndex;

            // Retrieve the DataTable from the session
            DataTable dt = (DataTable)Session["data"];

            // Remove the row from the DataTable
            dt.Rows.RemoveAt(rowIndex);

            // Update the session variable
            Session["buyitems"] = dt;

            // Bind the DataTable to the GridView
            GridView4.DataSource = dt;
            GridView4.DataBind();

            // Recalculate the total sum
            calculateSum();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}