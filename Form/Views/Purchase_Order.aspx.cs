using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Drawing.Printing;

namespace Panaderia.Form.Views
{
    public partial class Purchase_Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            // Refresh the data grid view
            //GridView1.DataBind();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            // Print the data grid view
            //GridView1.PrintToPrinter();
            //GridView1.Print();


            // Print the data grid view as a table
            //GridView1.PrintToPrinter(GridViewPrintMode.Table);

            // Print the data grid view to a specific printer
            //GridView1.PrintToPrinter("Printer Name");

            // Print the data grid view
            //GridView1.PrintToPrinter();
        }

        protected void btnPrintList_Click(object sender, EventArgs e)
        {
            // Print the data grid view as a list
            //GridView1.PrintToPrinter(GridViewPrintMode.List);
        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {

        }

        protected void txtStartDate_TextChanged(object sender, EventArgs e)
        {

        }
    }
}