using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Panaderia.Form.Tools
{
    public partial class Reminders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get the valid login user name from the default.aspx.cs code btnLogin_Click() function.
            string validUsername = (string)System.Web.HttpContext.Current.Session["ValidUsername"];

            // Set the value of the TextBox control.
            User.Text = validUsername;

        }

        protected void BtnExit_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/default.aspx");

        }

    }
}