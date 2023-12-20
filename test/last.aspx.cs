using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Panaderia.test
{
    public partial class last : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize GridView data source
                List<Product> products = new List<Product>
        {
            new Product { ProductName = "Product A", Price = 10.00 },
            new Product { ProductName = "Product B", Price = 20.00 },
            // Add more products as needed
        };

                GridView1.DataSource = products;
                GridView1.DataBind();
            }
            else
            {
                // Ensure GridView is always bound on postback
                GridView1.DataSource = ViewState["Products"] as List<Product>;
                GridView1.DataBind();
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Retrieve the current list of products from ViewState
            List<Product> currentProducts = ViewState["Products"] as List<Product>;

            if (currentProducts == null)
            {
                currentProducts = new List<Product>();
            }

            // Add a sample product
            currentProducts.Add(new Product { ProductName = "New Product", Price = 15.00 });

            // Save the updated list of products to ViewState
            ViewState["Products"] = currentProducts;

            // Update GridView and total price label
            GridView1.DataSource = currentProducts;
            GridView1.DataBind();

            double totalPrice = currentProducts.Sum(p => p.Price);
            lblTotalPrice.Text = $"Total Price: ${totalPrice:F2}";
        }

        // Define a simple Product class
        public class Product
        {
            public string ProductName { get; set; }
            public double Price { get; set; }
        }
    }
}
    
