using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services;
using System.Data;


namespace Panaderia.test
{
    public partial class dataplus : System.Web.UI.Page
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
    

    protected void btnSave_Click(object sender, EventArgs e)
        {

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
    }
}