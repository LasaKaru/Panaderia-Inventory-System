﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Data;
using System.Data.Entity;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.IO;
using Panaderia.DataAccessLayer;

namespace Panaderia.test
{
    public partial class addtogridto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Your connection string
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            ScriptManager.RegisterStartupScript(this, GetType(), "SaveDataScript", "function saveDataToServer() { SaveData(); }", true);
            ScriptManager.RegisterStartupScript(this, GetType(), "GetDataScript", "function refreshGridView() { GetData(); }", true);
            // Your existing code

            // Register the SaveData method as a web service
            ScriptManager.RegisterStartupScript(this, GetType(), "SaveDataScript", "function saveDataToServer() { SaveData(); }", true);

            {
                LoadItemData();
            }

        }

        // WebMethod to save data
        [WebMethod]
        public static void SaveData(List<List<string>> tableData)
        {
            // Your connection string
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            // Iterate through the tableData and insert into the database
            foreach (var rowData in tableData)
            {
                InsertRowIntoDatabase(connectionString, rowData);
            }


        }
        private void LoadItemData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT item_nu,code,Description,Price,PSize,Pascks,Nos,Dis,Amount,Usize FROM [Panaderia].[dbo].[MF_item]";

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



        private static void InsertRowIntoDatabase(string connectionString, List<string> rowData)
        {
            // Assuming your table has columns: item_nu, TextBox2, txtcode, etc.
            string query = "INSERT INTO [dbo].[MF_item] (item_nu, TextBox2, txtcode, txtDescription, txtPrice, txtPSize, txtPascks, txtNos, txtDis, txtAmount) " +
                           "VALUES (@item_nu, @TextBox2, @txtcode, @txtDescription, @txtPrice, @txtPSize, @txtPascks, @txtNos, @txtDis, @txtAmount)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                // Add parameters
                command.Parameters.AddWithValue("@item_nu", rowData[0]);
                command.Parameters.AddWithValue("@TextBox2", rowData[1]);
                command.Parameters.AddWithValue("@txtcode", rowData[2]);
                command.Parameters.AddWithValue("@txtDescription", rowData[3]);
                command.Parameters.AddWithValue("@txtPrice", rowData[4]);
                command.Parameters.AddWithValue("@txtPSize", rowData[5]);
                command.Parameters.AddWithValue("@txtPascks", rowData[6]);
                command.Parameters.AddWithValue("@txtNos", rowData[7]);
                command.Parameters.AddWithValue("@txtDis", rowData[8]);
                command.Parameters.AddWithValue("@txtAmount", rowData[9]);

                // Open the connection and execute the query
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        // WebMethod to retrieve data
        [WebMethod]
        public static string GetData()
        {
            // Your connection string
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            // Your existing query
            string query = "SELECT item_nu, TextBox2, txtcode, txtDescription, txtPrice, txtPSize, txtPascks, txtNos, txtDis, txtAmount FROM [Panaderia].[dbo].[MF_item]";

            using (SqlConnection connection = new SqlConnection(connectionString))
            using (SqlCommand command = new SqlCommand(query, connection))
            using (SqlDataAdapter adapter = new SqlDataAdapter(command))
            {
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                // Convert DataTable to HTML string for GridView
                string htmlString = ConvertDataTableToHtml(dt);

                return htmlString;
            }
        }

        // Helper method to convert DataTable to HTML string
        private static string ConvertDataTableToHtml(DataTable dt)
        {
            System.Text.StringBuilder html = new System.Text.StringBuilder();

            // Table start
            html.Append("<table border='1'>");

            // Header row
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>" + column.ColumnName + "</th>");
            }
            html.Append("</tr>");

            // Data rows
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (object item in row.ItemArray)
                {
                    html.Append("<td>" + item.ToString() + "</td>");
                }
                html.Append("</tr>");
            }

            // Table end
            html.Append("</table>");

            return html.ToString();
        }

        /*public class WaybillEntry
        {
            public int LineNumber { get; set; }
            public string ItemCode { get; set; }
            public string Description { get; set; }
            public decimal Price { get; set; }
            public string PSize { get; set; }
            public int Packs { get; set; }
            public int Nos { get; set; }
            public decimal Discount { get; set; }
            public decimal Amount { get; set; }
        }*/

        public class WaybillEntry
        {
            public int LineNumber { get; set; }
            public string ItemCode { get; set; }
            public string Description { get; set; }
            public decimal Price { get; set; }
            public string PSize { get; set; }
            public int Packs { get; set; }
            public int Nos { get; set; }
            public decimal Discount { get; set; }
            public decimal Amount { get; set; }
        }

        /*protected void SaveAndPrintButton_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            
            List<WaybillEntry> waybillEntries = new List<WaybillEntry>();

            foreach (GridViewRow row in yourGridView.Rows)
            {
                WaybillEntry entry = new WaybillEntry();
                entry.LineNumber = Convert.ToInt32(row.Cells[0].Text);
                entry.ItemCode = row.Cells[1].Text;
                entry.Description = row.Cells[2].Text;
                entry.Price = Convert.ToDecimal(row.Cells[3].Text);
                entry.PSize = row.Cells[4].Text;
                entry.Packs = Convert.ToInt32(row.Cells[5].Text);
                entry.Nos = Convert.ToInt32(row.Cells[6].Text);
                entry.Discount = Convert.ToDecimal(row.Cells[7].Text);
                entry.Amount = Convert.ToDecimal(row.Cells[8].Text);

                waybillEntries.Add(entry);
            }

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Save data to database using parameterized queries
                    foreach (WaybillEntry entry in waybillEntries)
                    {
                        string sql = "INSERT INTO WaybillEntries (LineNumber, ItemCode, Description, Price, PSize, Packs, Nos, Discount, Amount, PrintDate) VALUES (@LineNumber, @ItemCode, @Description, @Price, @PSize, @Packs, @Nos, @Discount, @Amount, GETUTCDATE())";
                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@LineNumber", entry.LineNumber);
                            command.Parameters.AddWithValue("@ItemCode", entry.ItemCode);
                            command.Parameters.AddWithValue("@Description", entry.Description);
                            command.Parameters.AddWithValue("@Price", entry.Price);
                            command.Parameters.AddWithValue("@PSize", entry.PSize);
                            command.Parameters.AddWithValue("@Packs", entry.Packs);
                            command.Parameters.AddWithValue("@Nos", entry.Nos);
                            command.Parameters.AddWithValue("@Discount", entry.Discount);
                            command.Parameters.AddWithValue("@Amount", entry.Amount);

                            command.ExecuteNonQuery();
                        }
                    }

                    // Perform bulk insert into the database
                   // BulkInsertWaybillEntries(connection, waybillEntries);

                    // Print the waybill
                    PrintWaybill(waybillEntries);

                    // Clear GridView and data object
                    yourGridView.DataSource = null;
                    yourGridView.DataBind();
                    waybillEntries.Clear();

                    // Optionally delete data from database
                    string deleteSql = "DELETE FROM WaybillEntries WHERE PrintDate = GETUTCDATE()";
                    using (SqlCommand deleteCommand = new SqlCommand(deleteSql, connection))
                    {
                        deleteCommand.ExecuteNonQuery();
                    }
                }
            }


            catch (Exception ex)
            {
                // Handle exception
                // Log the exception (consider using a logging framework like log4net or Serilog)
                // You can log to a file, database, or any other suitable destination
                LogException(ex);

                // Optionally display a user-friendly error message
                ShowErrorMessage("An unexpected error occurred. Please try again later.");

                // You may also redirect the user to an error page
                // Response.Redirect("ErrorPage.aspx");

                // Handle the exception-specifically if needed
                if (ex is SqlException)
                {
                    // Handle SQL-specific exception
                    ShowErrorMessage("Database error. Please contact support.");
                }
                else if (ex is InvalidOperationException)
                {
                    // Handle InvalidOperationException
                    ShowErrorMessage("Invalid operation. Please try again.");
                }
                // Add more specific exception handling as required
                else
                {
                    // Handle other exceptions
                    ShowErrorMessage("An unexpected error occurred. Please try again later.");
                }
            }

            
        }*/

        private void LogException(Exception ex)
        {
            // Implement your logging logic here
            // For example, using log4net, Serilog, or any other logging framework
        }

        private void ShowErrorMessage(string message)
        {

        }

        private void BulkInsertWaybillEntries(SqlConnection connection, List<WaybillEntry> entries)
        {
            // Implement bulk insert logic here
            // You can use DataTable, Table-Valued Parameters, or other methods based on your preference
            // Example using Table-Valued Parameters: https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/sql/table-valued-parameters
        }

        private void PrintWaybill(List<WaybillEntry> entries)
        {
            // Implement your waybill printing logic here
            // Use entries to generate the waybill
        }

        










        protected void SaveAndPrintButton_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            List<WaybillEntry> waybillEntries = new List<WaybillEntry>();

            foreach (GridViewRow row in yourGridView.Rows)
            {
                WaybillEntry entry = new WaybillEntry();
                entry.LineNumber = Convert.ToInt32(row.Cells[0].Text);
                entry.ItemCode = row.Cells[1].Text;
                entry.Description = row.Cells[2].Text;
                entry.Price = Convert.ToDecimal(row.Cells[3].Text);
                entry.PSize = row.Cells[4].Text;
                entry.Packs = Convert.ToInt32(row.Cells[5].Text);
                entry.Nos = Convert.ToInt32(row.Cells[6].Text);
                entry.Discount = Convert.ToDecimal(row.Cells[7].Text);
                entry.Amount = Convert.ToDecimal(row.Cells[8].Text);

                waybillEntries.Add(entry);
            }

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Perform bulk insert into the database
                    BulkInsertWaybillEntries1(connection, waybillEntries);

                    // Print the waybill
                    PrintWaybill(waybillEntries);

                    // Clear GridView and data object
                    yourGridView.DataSource = null;
                    yourGridView.DataBind();
                    waybillEntries.Clear();
                }
            }
            catch (Exception ex)
            {
                LogException(ex);
                ShowErrorMessage("An unexpected error occurred. Please try again later.");
            }
        }


        public void BulkInsertWaybillEntries1(SqlConnection connection, List<WaybillEntry> entries)
        {
            foreach (WaybillEntry entry in entries)
            {
                string insertSql = "INSERT INTO WaybillEntries (LineNumber, ItemCode, Description, Price, PSize, Packs, Nos, Discount, Amount, PrintDate) " +
                                   "VALUES (@LineNumber, @ItemCode, @Description, @Price, @PSize, @Packs, @Nos, @Discount, @Amount, GETUTCDATE())";

                using (SqlCommand command = new SqlCommand(insertSql, connection))
                {
                    command.Parameters.AddWithValue("@LineNumber", entry.LineNumber);
                    command.Parameters.AddWithValue("@ItemCode", entry.ItemCode);
                    command.Parameters.AddWithValue("@Description", entry.Description);
                    command.Parameters.AddWithValue("@Price", entry.Price);
                    command.Parameters.AddWithValue("@PSize", entry.PSize);
                    command.Parameters.AddWithValue("@Packs", entry.Packs);
                    command.Parameters.AddWithValue("@Nos", entry.Nos);
                    command.Parameters.AddWithValue("@Discount", entry.Discount);
                    command.Parameters.AddWithValue("@Amount", entry.Amount);

                    command.ExecuteNonQuery();
                }
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            List<WaybillEntry> waybillEntries = new List<WaybillEntry>();

            foreach (GridViewRow row in yourGridView.Rows)
            {
                WaybillEntry entry = new WaybillEntry();
                entry.LineNumber = Convert.ToInt32(row.Cells[0].Text);
                entry.ItemCode = row.Cells[1].Text;
                entry.Description = row.Cells[2].Text;
                entry.Price = Convert.ToDecimal(row.Cells[3].Text);
                entry.PSize = row.Cells[4].Text;
                entry.Packs = Convert.ToInt32(row.Cells[5].Text);
                entry.Nos = Convert.ToInt32(row.Cells[6].Text);
                entry.Discount = Convert.ToDecimal(row.Cells[7].Text);
                entry.Amount = Convert.ToDecimal(row.Cells[8].Text);

                waybillEntries.Add(entry);
            }

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Save data to database using parameterized queries
                    foreach (WaybillEntry entry in waybillEntries)
                    {
                        string sql = "INSERT INTO WaybillEntries (LineNumber, ItemCode, Description, Price, PSize, Packs, Nos, Discount, Amount, PrintDate) VALUES (@LineNumber, @ItemCode, @Description, @Price, @PSize, @Packs, @Nos, @Discount, @Amount, GETUTCDATE())";
                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@LineNumber", entry.LineNumber);
                            command.Parameters.AddWithValue("@ItemCode", entry.ItemCode);
                            command.Parameters.AddWithValue("@Description", entry.Description);
                            command.Parameters.AddWithValue("@Price", entry.Price);
                            command.Parameters.AddWithValue("@PSize", entry.PSize);
                            command.Parameters.AddWithValue("@Packs", entry.Packs);
                            command.Parameters.AddWithValue("@Nos", entry.Nos);
                            command.Parameters.AddWithValue("@Discount", entry.Discount);
                            command.Parameters.AddWithValue("@Amount", entry.Amount);

                            command.ExecuteNonQuery();
                        }
                    }

                    // Perform bulk insert into the database
                   // BulkInsertWaybillEntries(connection, waybillEntries);

                    // Print the waybill
                    PrintWaybill(waybillEntries);

                    // Clear GridView and data object
                    yourGridView.DataSource = null;
                    yourGridView.DataBind();
                    waybillEntries.Clear();

                    // Optionally delete data from database
                    string deleteSql = "DELETE FROM WaybillEntries WHERE PrintDate = GETUTCDATE()";
                    using (SqlCommand deleteCommand = new SqlCommand(deleteSql, connection))
                    {
                        deleteCommand.ExecuteNonQuery();
                    }
                }
            }


            catch (Exception ex)
            {
                // Handle exception
            }

        }

        protected void btnSaveAndPrintButton(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            List<WaybillEntry> waybillEntries = new List<WaybillEntry>();

            foreach (GridViewRow row in yourGridView.Rows)
            {
                WaybillEntry entry = new WaybillEntry();
                entry.LineNumber = Convert.ToInt32(row.Cells[0].Text);
                entry.ItemCode = row.Cells[1].Text;
                entry.Description = row.Cells[2].Text;
                entry.Price = Convert.ToDecimal(row.Cells[3].Text);
                entry.PSize = row.Cells[4].Text;
                entry.Packs = Convert.ToInt32(row.Cells[5].Text);
                entry.Nos = Convert.ToInt32(row.Cells[6].Text);
                entry.Discount = Convert.ToDecimal(row.Cells[7].Text);
                entry.Amount = Convert.ToDecimal(row.Cells[8].Text);

                waybillEntries.Add(entry);
            }

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Save data to database using parameterized queries
                    foreach (WaybillEntry entry in waybillEntries)
                    {
                        string sql = "INSERT INTO WaybillEntries (LineNumber, ItemCode, Description, Price, PSize, Packs, Nos, Discount, Amount, PrintDate) VALUES (@LineNumber, @ItemCode, @Description, @Price, @PSize, @Packs, @Nos, @Discount, @Amount, GETUTCDATE())";
                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@LineNumber", entry.LineNumber);
                            command.Parameters.AddWithValue("@ItemCode", entry.ItemCode);
                            command.Parameters.AddWithValue("@Description", entry.Description);
                            command.Parameters.AddWithValue("@Price", entry.Price);
                            command.Parameters.AddWithValue("@PSize", entry.PSize);
                            command.Parameters.AddWithValue("@Packs", entry.Packs);
                            command.Parameters.AddWithValue("@Nos", entry.Nos);
                            command.Parameters.AddWithValue("@Discount", entry.Discount);
                            command.Parameters.AddWithValue("@Amount", entry.Amount);

                            command.ExecuteNonQuery();
                        }
                    }

                    // Perform bulk insert into the database
                    //BulkInsertWaybillEntries(connection, waybillEntries);

                    // Print the waybill
                    PrintWaybill(waybillEntries);

                    // Clear GridView and data object
                    yourGridView.DataSource = null;
                    yourGridView.DataBind();
                    waybillEntries.Clear();

                    // Optionally delete data from database
                    string deleteSql = "DELETE FROM WaybillEntries WHERE PrintDate = GETUTCDATE()";
                    using (SqlCommand deleteCommand = new SqlCommand(deleteSql, connection))
                    {
                        deleteCommand.ExecuteNonQuery();
                    }
                }
            }


            catch (Exception ex)
            {
                // Handle exception
            }

        }

        protected void btnBrowse_Click(object sender, EventArgs e)
        {

        }

        protected void btnExit_Click(object sender, EventArgs e)
        {

        }

        protected void Unnamed4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void yourGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            List<WaybillEntry> waybillEntries = new List<WaybillEntry>();

            foreach (GridViewRow row in yourGridView.Rows)
            {
                WaybillEntry entry = new WaybillEntry();
                entry.LineNumber = Convert.ToInt32(row.Cells[0].Text);
                entry.ItemCode = row.Cells[1].Text;
                entry.Description = row.Cells[2].Text;
                entry.Price = Convert.ToDecimal(row.Cells[3].Text);
                entry.PSize = row.Cells[4].Text;
                entry.Packs = Convert.ToInt32(row.Cells[5].Text);
                entry.Nos = Convert.ToInt32(row.Cells[6].Text);
                entry.Discount = Convert.ToDecimal(row.Cells[7].Text);
                entry.Amount = Convert.ToDecimal(row.Cells[8].Text);

                waybillEntries.Add(entry);
            }

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Save data to database using parameterized queries
                    foreach (WaybillEntry entry in waybillEntries)
                    {
                        string sql = "INSERT INTO WaybillEntries (LineNumber, ItemCode, Description, Price, PSize, Packs, Nos, Discount, Amount, PrintDate) VALUES (@LineNumber, @ItemCode, @Description, @Price, @PSize, @Packs, @Nos, @Discount, @Amount, GETUTCDATE())";
                        using (SqlCommand command = new SqlCommand(sql, connection))
                        {
                            command.Parameters.AddWithValue("@LineNumber", entry.LineNumber);
                            command.Parameters.AddWithValue("@ItemCode", entry.ItemCode);
                            command.Parameters.AddWithValue("@Description", entry.Description);
                            command.Parameters.AddWithValue("@Price", entry.Price);
                            command.Parameters.AddWithValue("@PSize", entry.PSize);
                            command.Parameters.AddWithValue("@Packs", entry.Packs);
                            command.Parameters.AddWithValue("@Nos", entry.Nos);
                            command.Parameters.AddWithValue("@Discount", entry.Discount);
                            command.Parameters.AddWithValue("@Amount", entry.Amount);

                            command.ExecuteNonQuery();
                        }
                    }

                    // Perform bulk insert into the database
                   // BulkInsertWaybillEntries(connection, waybillEntries);

                    // Print the waybill
                    PrintWaybill(waybillEntries);

                    // Clear GridView and data object
                    yourGridView.DataSource = null;
                    yourGridView.DataBind();
                    waybillEntries.Clear();

                    // Optionally delete data from database
                    string deleteSql = "DELETE FROM WaybillEntries WHERE PrintDate = GETUTCDATE()";
                    using (SqlCommand deleteCommand = new SqlCommand(deleteSql, connection))
                    {
                        deleteCommand.ExecuteNonQuery();
                    }
                }
            }


            catch (Exception ex)
            {
                // Handle exception
            }

        }
    }
}