using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Panaderia.DataAccessLayer
{
    public class clsCOMMON
    {
        private string _empid = string.Empty;

        public string EMPID
        {
            get { return _empid; }
            set { _empid = value; }
        }

        string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

        public DataSet GetGetDetails(clsCOMMON objAll)
        {
            DataSet dataSet = new DataSet();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand cmd = new SqlCommand("YourStoredProcedureName", connection))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Add a parameter for the stored procedure
                    cmd.Parameters.Add(new SqlParameter("@EMPID", SqlDbType.NVarChar, 255));
                    cmd.Parameters["@EMPID"].Value = objAll.EMPID;

                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(dataSet);
                    }
                }
            }

            return dataSet;
        }

        public DataSet GetDashboardData(clsCOMMON objAll)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            DataHelper dataHelper = new DataHelper(connectionString);

            SqlParameter[] parameters = new SqlParameter[1];

            parameters[0] = new SqlParameter("@EMPID", SqlDbType.NVarChar, 255);
            parameters[0].Value = objAll.EMPID;

            return dataHelper.ExecuteStoredProcedureAsDataSet("Usp_SelDashboardData", parameters);

        }



        public DataSet GetPurchaseData(clsCOMMON objAll)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            DataHelper dataHelper = new DataHelper(connectionString);

            SqlParameter[] parameters = new SqlParameter[1];

            parameters[0] = new SqlParameter("@EMPID", SqlDbType.NVarChar, 255);
            parameters[0].Value = objAll.EMPID;

            return dataHelper.ExecuteStoredProcedureAsDataSet("Usp_SelPurchaceData", parameters);

        }

        public DataSet GetPReturnData(clsCOMMON objAll)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            DataHelper dataHelper = new DataHelper(connectionString);

            SqlParameter[] parameters = new SqlParameter[1];

            parameters[0] = new SqlParameter("@EMPID", SqlDbType.NVarChar, 255);
            parameters[0].Value = objAll.EMPID;

            return dataHelper.ExecuteStoredProcedureAsDataSet("Usp_SelPReturnData", parameters);

        }

        public DataSet GetSalesCreditData(clsCOMMON objAll)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            DataHelper dataHelper = new DataHelper(connectionString);

            SqlParameter[] parameters = new SqlParameter[1];

            parameters[0] = new SqlParameter("@EMPID", SqlDbType.NVarChar, 255);
            parameters[0].Value = objAll.EMPID;

            return dataHelper.ExecuteStoredProcedureAsDataSet("Usp_SelSalesCreditData", parameters);

        }

        public DataSet GetinvoiceCreditData(clsCOMMON objAll)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            DataHelper dataHelper = new DataHelper(connectionString);

            SqlParameter[] parameters = new SqlParameter[1];

            parameters[0] = new SqlParameter("@EMPID", SqlDbType.NVarChar, 255);
            parameters[0].Value = objAll.EMPID;

            return dataHelper.ExecuteStoredProcedureAsDataSet("Usp_SelinvoiceCreditData", parameters);

        }
        public DataSet GetreturncreditData(clsCOMMON objAll)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            DataHelper dataHelper = new DataHelper(connectionString);

            SqlParameter[] parameters = new SqlParameter[1];

            parameters[0] = new SqlParameter("@EMPID", SqlDbType.NVarChar, 255);
            parameters[0].Value = objAll.EMPID;

            return dataHelper.ExecuteStoredProcedureAsDataSet("Usp_SelGetreturncreditData", parameters);

        }
        public DataSet GetexcAdjustmentData(clsCOMMON objAll)
        {
            string connectionString = "Data Source=CCPHIT-GUNATLAP\\SQLEXPRESS;Initial Catalog=Panaderia;Integrated Security=True";

            DataHelper dataHelper = new DataHelper(connectionString);

            SqlParameter[] parameters = new SqlParameter[1];

            parameters[0] = new SqlParameter("@EMPID", SqlDbType.NVarChar, 255);
            parameters[0].Value = objAll.EMPID;

            return dataHelper.ExecuteStoredProcedureAsDataSet("Usp_SelGetexcAdjustmentData", parameters);

        }

    }
}