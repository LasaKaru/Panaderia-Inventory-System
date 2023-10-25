<!DOCTYPE html>

<html lang="en">
    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><%: Page.Title %> - Panaderia IMS</title>

        <asp:PlaceHolder runat="server">
            <%: Scripts.Render("~/bundles/modernizr") %>
        </asp:PlaceHolder>

        <webopt:bundlereference runat="server" path="~/Content/css" />
        <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    </head>
    <body>

        <form runat="server">
            <asp:ScriptManager runat="server">
                <Scripts>
                    <%--To learn more about bundling scripts in ScriptManager
                    see https://go.microsoft.com/fwlink/?LinkID=301884 --%>
                    
                    <asp:ScriptReference Name="MsAjaxBundle" />
                    <asp:ScriptReference Name="jquery" />
                    <asp:ScriptReference Name="bootstrap" />
                    <asp:ScriptReference
                        Name="WebForms.js"
                        Assembly="System.Web"
                        Path="~/Scripts/WebForms/WebForms.js"
                    />
                    <asp:ScriptReference
                        Name="WebUIValidation.js"
                        Assembly="System.Web"
                        Path="~/Scripts/WebForms/WebUIValidation.js"
                    />
                    <asp:ScriptReference
                        Name="MenuStandards.js"
                        Assembly="System.Web"
                        Path="~/Scripts/WebForms/MenuStandards.js"
                    />
                    <asp:ScriptReference
                        Name="GridView.js"
                        Assembly="System.Web"
                        Path="~/Scripts/WebForms/GridView.js"
                    />
                    <asp:ScriptReference
                        Name="DetailsView.js"
                        Assembly="System.Web"
                        Path="~/Scripts/WebForms/DetailsView.js"
                    />
                    <asp:ScriptReference
                        Name="TreeView.js"
                        Assembly="System.Web"
                        Path="~/Scripts/WebForms/TreeView.js"
                    />
                    <asp:ScriptReference
                        Name="WebParts.js"
                        Assembly="System.Web"
                        Path="~/Scripts/WebForms/WebParts.js"
                    />
                    <asp:ScriptReference
                        Name="Focus.js"
                        Assembly="System.Web"
                        Path="~/Scripts/WebForms/Focus.js"
                    />
                    <asp:ScriptReference Name="WebFormsBundle" />
                    
                </Scripts>
            </asp:ScriptManager>
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <div class="navbar-header">
                        <button
                            type="button"
                            class="navbar-toggle"
                            data-toggle="collapse"
                            data-target=".navbar-collapse"
                        >
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            
                            

                            <li>
                                <a
                                    href="#"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    >Master Files</a
                                >
                                <ul class="dropdown-menu">
                                    <li><a href="#">Products</a></li>
                                    <li><a href="#">Supplier</a></li>
                                    <li><a href="#">Customer</a></li>
                                    <li><a href="#">User Profile</a></li>
                                    <li><a href="#">Address Book</a></li>
                                </ul>
                            </li>

                            <li>
                                <a
                                    href="#"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    >Inventory</a
                                >
                                <ul class="dropdown-menu">
                                    <li><a href="#">Purchase</a></li>
                                    <li>
                                        <a href="#">sub categories </a>
                                        <ul>
                                            <li>
                                                <a href="#">Purchase Order</a>
                                            </li>
                                            <li>
                                                <a href="#">Goods Recive</a>
                                            </li>
                                            <li>
                                                <a href="#">Purchase Return</a>
                                            </li>
                                        </ul>
                                    </li>
                                    

                                    <li><a href="#">Sales</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li>
                                                <a href="#">Order-Credit</a>
                                            </li>
                                            <li>
                                                <a href="#">Invoice - Credit</a>
                                            </li>
                                            <li>
                                                <a href="#">Return - Credit</a>
                                            </li>
                                            <li>
                                                <a href="#">Order Data Load</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Adjustment</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li><a href="#">Excess</a></li>
                                            <li><a href="#">Shortage</a></li>
                                        </ul>
                                    </div>
                                </ul>
                            </li>

                            <li>
                                <a
                                    href="#"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    >Views</a
                                >
                                <ul class="dropdown-menu">
                                    <li><a href="#">Purchase</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li><a href="#">Order</a></li>
                                            <li>
                                                <a href="#">Goods Receiving</a>
                                            </li>
                                            <li>
                                                <a href="#">Purchase Return</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Sales</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li><a href="#">Order</a></li>
                                            <li><a href="#">Invoice</a></li>
                                            <li><a href="#">Return</a></li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Inventory</a></li>
                                </ul>
                            </li>

                            <li>
                                <a
                                    href="#"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    >Reports</a
                                >
                                <ul class="dropdown-menu">
                                    <li><a href="#">Purchase</a></li>
                                    <li><a href="#">Sales</a></li>
                                    <li><a href="#">Analytics</a></li>
                                </ul>
                            </li>

                            <li>
                                <a
                                    href="#"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    >Day Books</a
                                >
                                <ul class="dropdown-menu">
                                    <li><a href="#">Cash Book</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li><a href="#">Receipt</a></li>
                                            <li><a href="#">Payment</a></li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Purchase Journal</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li><a href="#">GRN Posting</a></li>
                                            <li>
                                                <a href="#">Purchase Invoice</a>
                                            </li>
                                            <li>
                                                <a href="#">Purchase Return</a>
                                            </li>
                                            <li><a href="#">Debit Note</a></li>
                                            <li>
                                                <a href="#">Payment Voucher</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Sales Jounal</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li>
                                                <a href="#">Sales Posting</a>
                                            </li>
                                            <li>
                                                <a href="#">Sales Invoice</a>
                                            </li>
                                            <li>
                                                <a href="#">Sales Report</a>
                                            </li>
                                            <li><a href="#">Credit Note</a></li>
                                            <li><a href="#">Receipt</a></li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Service Journal</a></li>

                                    <li><a href="#">Petty Cash</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li><a href="#">Payment</a></li>
                                            <li><a href="#">Batch</a></li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Set - OFF</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li><a href="#">Receipt</a></li>
                                            <li><a href="#">Payment</a></li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Journal Entry</a></li>
                                    <li><a href="#">Month End</a></li>
                                </ul>
                            </li>

                            <li>
                                <a
                                    href="#"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    >Accounts</a
                                >
                                <ul class="dropdown-menu">
                                    <li><a href="#">Cash Book</a></li>

                                    <li><a href="#">Journal</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li><a href="#">Purchase</a></li>
                                            <li>
                                                <a href="#">Purchase Return</a>
                                            </li>
                                            <li><a href="#">Sales</a></li>
                                            <li>
                                                <a href="#">Sales Return</a>
                                            </li>
                                            <li>
                                                <a href="#">Cash Receipts</a>
                                            </li>
                                            <li>
                                                <a href="#">Cash Payment</a>
                                            </li>
                                            <li>
                                                <a href="#"
                                                    >Genaral -( Services )</a
                                                >
                                            </li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Sub Ledger</a></li>
                                    <div id="sub-categories">
                                        <ul>
                                            <li>
                                                <a href="#"
                                                    >Account Receivable</a
                                                >
                                            </li>
                                            <li>
                                                <a href="#">Account Payable</a>
                                            </li>
                                        </ul>
                                    </div>

                                    <li><a href="#">Trial Balance</a></li>
                                    <li>
                                        <a href="#">Profit & Loss Account</a>
                                    </li>
                                    <li><a href="#">Balance Sheet</a></li>
                                </ul>
                            </li>

                            <li>
                                <a
                                    href="#"
                                    class="dropdown-toggle"
                                    data-toggle="dropdown"
                                    >Tools</a
                                >
                                <ul class="dropdown-menu">
                                    <li><a href="#">Remainders</a></li>
                                    <li><a href="#">Fallow Up</a></li>
                                </ul>
                            </li>                            
                        </ul>
                    </div>
                </div>
            </div>
            <div class="container body-content">
                
                <hr />
                <footer>
                    
                </footer>   
                
                <script type="text/javascript">
                    document.body.classList.remove('hide-navigation');
                </script>                  
            </div>
        </form>
    </body>
</html>
