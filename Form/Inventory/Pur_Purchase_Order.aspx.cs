using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Panaderia.Form.Inventory
{
    public partial class Pur_Purchase_Order : System.Web.UI.Page
    {
        private static string query;

        public static object yourEndDateValue { get; private set; }
        public static object yourStartDateValue { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public static string GetData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=MyBooks;Integrated Security=True";
            string data = "SELECT * FROM dbo.TX_Inventory"; // Fetch all data

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(data, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        // Retrieve the schema (column names) from the reader
                        var schema = reader.GetSchemaTable();

                        // Create a list to store column names
                        List<string> columnNames = new List<string>();

                        foreach (DataRow column in schema.Rows)
                        {
                            string columnName = column.Field<string>("ColumnName");
                            columnNames.Add(columnName);
                        }

                        // Use columnNames list to generate the header row in the modal content
                        string headerRow = string.Join(", ", columnNames);

                        // Create a StringBuilder to build the response
                        StringBuilder response = new StringBuilder();
                        response.Append(headerRow); // Add header row

                        // Loop through the data and append each row
                        while (reader.Read())
                        {
                            List<string> rowValues = new List<string>();
                            foreach (string columnName in columnNames)
                            {
                                // Read the value of each column and escape any special characters
                                string value = HttpUtility.HtmlEncode(reader[columnName].ToString());
                                rowValues.Add(value);
                            }

                            string row = string.Join(", ", rowValues);
                            response.Append("\n" + row); // Add row data
                        }

                        return response.ToString();
                    }
                }
            }

            return string.Empty; // Return empty string in case of no data or errors
        }







    }
}