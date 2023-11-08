using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace Panaderia.Form.Tools
{
    public partial class ModalPopup : System.Web.UI.Page
    {
        private int pageSize = 150;
        private int currentPage = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }

        /**

        protected void lnkPrev_Click(object sender, EventArgs e)
        {
            if (currentPage > 1)
            {
                currentPage--;
                BindData();
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            // Calculate the starting row for the next page
            int startingRow = (currentPage * pageSize) + 1;

            // Check if there are more records to display on the next page
            bool moreRecordsExist = CheckIfMoreRecordsExist(startingRow);

            if (moreRecordsExist)
            {
                currentPage++;
                BindData();
            }
            else
            {
                // Handle the case when there are no more records to display
                // You can disable the "Next" button or show a message to the user.
            }
        }

        private bool CheckIfMoreRecordsExist(int startingRow)
        {
            // Implement logic to check if there are more records in the database
            // based on the starting row for the next page.
            // You can query the total number of records in the database and compare it.
            // Return true if more records exist, false otherwise.
            // You can also pass this logic to your data access layer.

            // For example:
             int totalRecords = GetTotalRecordsCountFromDatabase();
             return startingRow <= totalRecords;

            // Replace the above example with your database-specific logic.
            // This is a simplified example to illustrate the concept.
            return true; // Assume there are more records for the sake of illustration.
        }


        private int GetTotalRecordsCountFromDatabase()
        {
            int totalRecords = 0;

            // Your database connection string
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // SQL query to count the total records
                string query = "SELECT COUNT(*) FROM [MyBooks].[dbo].[TX_Inventory]";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    // Execute the query and retrieve the count
                    totalRecords = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }

            return totalRecords;
        }



        private void BindData()
        {
            // Your database connection string
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Modify your SQL query to support pagination
                string query = $@"SELECT *
                                 FROM (SELECT ROW_NUMBER() OVER (ORDER BY Txn_Id) AS RowNum, *
                                       FROM [MyBooks].[dbo].[TX_Inventory]) AS Results
                                 WHERE RowNum > {(currentPage - 1) * pageSize}
                                 AND RowNum <= {currentPage * pageSize}";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    GridView1.DataSource = dataTable;
                    GridView1.DataBind();
                }
            }
        }
    
        **/

        protected void LoadData()
        {
            string connectionString = "Data Source=CCPHIT-LASANLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";
            string query = "SELECT Txn_Id, Company_ID, Branch_Id, Txn_Type FROM[MyBooks].[dbo].[TX_Inventory]";

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
    }


    /**
    public class YourDataAccessLayer
    {
        private string connectionString;

        public YourDataAccessLayer(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public List<InventoryItemDTO> SearchData(string searchCriteria)
        {
            List<InventoryItemDTO> results = new List<InventoryItemDTO>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "SELECT TransactionID, CompanyID, BranchID, TransactionType " +
                               "FROM TX_Inventory " +
                               "WHERE YourSearchColumn = @SearchCriteria";

                using (SqlCommand cmd = new SqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@SearchCriteria", searchCriteria);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            InventoryItemDTO item = new InventoryItemDTO
                            {
                                TransactionID = Convert.ToInt32(reader["TransactionID"]),
                                CompanyID = Convert.ToInt32(reader["CompanyID"]),
                                BranchID = Convert.ToInt32(reader["BranchID"]),
                                TransactionType = reader["TransactionType"].ToString()
                                // Set other properties as needed
                            };
                            results.Add(item);
                        }
                    }
                }
            }

            return results;
        }
    }

    public class InventoryItemDTO
    {
        public int TransactionID { get; set; }
        public int CompanyID { get; set; }
        public int BranchID { get; set; }
        public string TransactionType { get; set; }
        // Add properties for other columns as needed
    }
    **/
}