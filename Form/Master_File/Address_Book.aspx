<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Address_Book.aspx.cs" Inherits="Panaderia.Form.Master_File.Address_Book" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Address Book</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!--Common CSS File -->
    <link rel="stylesheet" href="../../Content/Navigation.css" media="screen" />


</head>
<body>
    <form id="form1" runat="server">
        
        <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <img src="../../cargillstransparent.png" width="105" height="53" onclick="window.location.href = '../../Dashboard.aspx'"/>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Master Files</a>
                        <ul class="dropdown-menu">
                            <li><a href="../Master_File/Products.aspx">Products</a></li>
                            <li><a href="../Master_File/Supplier.aspx">Supplier</a></li>
                            <li><a href="../Master_File/Customer.aspx">Customer</a></li>
                            <li><a href="../Master_File/User_Profile.aspx">User Profile</a></li>
                            <li><a href="../Master_File/Address_Book.aspx">Address Book</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"
                           class="dropdown-toggle"
                           data-toggle="dropdown">Inventory</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Purchase</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li>
                                        <a href="../Inventory/Pur_Purchase_Order.aspx">Purchase Order</a>
                                    </li>
                                    <li>
                                        <a href="../Inventory/Pur_Goods_Receive.aspx">Goods Receive</a>
                                    </li>
                                    <li>
                                        <a href="../Inventory/Pur_Purchase_Return.aspx">Purchase Return</a>
                                    </li>
                                </ul>
                            </div>
                            <li><a href="#">Sales</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li>
                                        <a href="../Inventory/Sales_Order_Credit.aspx">Order-Credit</a>
                                    </li>
                                    <li>
                                        <a href="../Inventory/Sales_Invoice_Credit.aspx">Invoice - Credit</a>
                                    </li>
                                    <li>
                                        <a href="../Inventory/Sales_Return_Credit.aspx">Return - Credit</a>
                                    </li>
                                    <li>
                                        <a href="../Inventory/Sales_Order_Data_Load.aspx">Order Data Load</a>
                                    </li>
                                </ul>
                            </div>
                            <li><a href="#">Adjustment</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li><a href="../Inventory/Adjustment_Excess">Excess</a></li>
                                    <li><a href="../Inventory/Adjustment_Shortage">Shortage</a></li>
                                </ul>
                            </div>
                        </ul>
                    </li>
                    <li>
                        <a href="#"
                           class="dropdown-toggle"
                           data-toggle="dropdown">Views</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Purchase</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li><a href="../Views/Purchase_Order.aspx">Order</a></li>
                                    <li>
                                        <a href="../Views/Purchase_Goods_Receiving.aspx">Goods Receiving</a>
                                    </li>
                                    <li>
                                        <a href="../Views/Purchase_Return.aspx">Purchase Return</a>
                                    </li>
                                </ul>
                            </div>
                            <li><a href="#">Sales</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li><a href="../Views/Sales_Order.aspx">Order</a></li>
                                    <li><a href="../Views/Sales_Invoice.aspx">Invoice</a></li>
                                    <li><a href="../Views/Sales_Return.aspx">Return</a></li>
                                </ul>
                            </div>
                            <li><a href="../Views/Inventory.aspx">Inventory</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Reports</a>
                        <ul class="dropdown-menu">
                            <li><a href="../Reports/Report_Purchase.aspx">Purchase</></li>
                            <li><a href="../Reports/Report_Sales.aspx">Sales</a></li>
                            <li><a href="../Reports/Report_Analytics.aspx">Analytics</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"
                           class="dropdown-toggle"
                           data-toggle="dropdown">Day Books</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Cash Book</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li><a href="../Day_Books/CashBook_Receipt.aspx">Receipt</a></li>
                                    <li><a href="../Day_Books/CashBook_Payment.aspx">Payment</a></li>
                                </ul>
                            </div>
                            <li><a href="#">Purchase Journal</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li><a href="../Day_Books/Purchase_Journal_GRN_Posting.aspx">GRN Posting</a></li>
                                    <li>
                                        <a href="../Day_Books/Purchase_Journal_Purchase_Invoice.aspx">Purchase Invoice</a>
                                    </li>
                                    <li>
                                        <a href="../Day_Books/Purchase_Journal_Purchase_Return.aspx">Purchase Return</a>
                                    </li>
                                    <li><a href="../Day_Books/Purchase_Journal_Debit_Note.aspx">Debit Note</a></li>
                                    <li>
                                        <a href="../Day_Books/Purchase_Journal_Payment_Voucher.aspx">Payment Voucher</a>
                                    </li>
                                </ul>
                            </div>
                            <li><a href="#">Sales Jounal</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li>
                                        <a href="../Day_Books/Sales_Journal_Sales_Posting.aspx">Sales Posting</a>
                                    </li>
                                    <li>
                                        <a href="../Day_Books/Sales_Journal_Sales_Invoice.aspx">Sales Invoice</a>
                                    </li>
                                    <li>
                                        <a href="../Day_Books/Sales_Journal_Sales_Return.aspx">Sales Return</a>
                                    </li>
                                    <li><a href="../Day_Books/Sales_Journal_Credit_Note.aspx">Credit Note</a></li>
                                    <li><a href="../Day_Books/Sales_Journal_Receipt.aspx">Receipt</a></li>
                                </ul>
                            </div>
                            <li><a href="../Day_Books/Service_Journal.aspx">Service Journal</a></li>
                            <li><a href="#">Petty Cash</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li><a href="../Day_Books/PettyCash_Payment.aspx">Payment</a></li>
                                    <li><a href="../Day_Books/PettyCash_Batch.aspx">Batch</a></li>
                                </ul>
                            </div>
                            <li><a href="#">Set - OFF</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li><a href="../Day_Books/SetOFF_Receipt.aspx">Receipt</a></li>
                                    <li><a href="../Day_Books/SetOFF_Payment.aspx">Payment</a></li>
                                </ul>
                            </div>
                            <li><a href="../Day_Books/Journal_Entry.aspx">Journal Entry</a></li>
                            <li><a href="../Day_Books/Month_End.aspx">Month End</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#"
                           class="dropdown-toggle"
                           data-toggle="dropdown">Accounts</a>
                        <ul class="dropdown-menu">
                            <li><a href="../Accounts/Cash_Book.aspx">Cash Book</a></li>

                            <li><a href="#">Journal</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li><a href="../Accounts/Journal_Purchase.aspx">Purchase</a></li>
                                    <li>
                                        <a href="../Accounts/Journal_Purchase_Return.aspx">Purchase Return</a>
                                    </li>
                                    <li><a href="../Accounts/Journal_Sales.aspx">Sales</a></li>
                                    <li>
                                        <a href="../Accounts/Journal_Sales_Return.aspx">Sales Return</a>
                                    </li>
                                    <li>
                                        <a href="../Accounts/Journal_Cash_Receipts.aspx">Cash Receipts</a>
                                    </li>
                                    <li>
                                        <a href="../Accounts/Journal_Cash_Payment.aspx">Cash Payment</a>
                                    </li>
                                    <li>
                                        <a href="../Accounts/Journal_Genaral(Services).aspx">Genaral -( Services )</a>
                                    </li>
                                </ul>
                            </div>
                            <li><a href="#">Sub Ledger</a></li>
                            <div id="sub-categories">
                                <ul>
                                    <li>
                                        <a href="../Accounts/SubLedger_Account_Receivable.aspx">Account Receivable</a>
                                    </li>
                                    <li>
                                        <a href="../Accounts/SubLedger_Account_Payable.aspx">Account Payable</a>
                                    </li>
                                </ul>
                            </div>
                            <li><a href="../Accounts/Trial_Balance.aspx">Trial Balance</a></li>
                            <li>
                                <a href="../Accounts/Proffit_and_Loss_Account.aspx">Profit & Loss Account</a>
                            </li>
                            <li><a href="../Accounts/Balance_Sheet.aspx">Balance Sheet</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tools</a>
                        <ul class="dropdown-menu">
                            <li><a href="../Tools/Reminders.aspx">Remainders</a></li>
                            <li><a href="../Tools/Follow_Up.aspx">Follow up</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    </form>

<br />
<br />

<br />

     <div class="auto-style32">
  <div class="table-row">
    <div class="table-cell header" style="background-color: #eb1f10; font-weight: bold;">Serial Number</div>
    <div class="table-cell" style="background-color: #eb1f10">
        <asp:textbox name="SerialNumber" runat="server" type="text" id="SerialNumber" class="input-field" readonly/></div>
    <div class="table-cell header" style="background-color: #eb1f10; font-weight: bold;">Date</div>
    <div class="table-cell" style="background-color: #eb1f10">
        <asp:textbox name="Country" runat="server" type="text" id="Date" class="input-field" readonly/></div>
    <div class="table-cell header" style="background-color: #eb1f10; font-weight: bold; ">User</div>
    <div class="table-cell" style="background-color: #eb1f10">
        <asp:textbox name="Code" runat="server" type="text" id="User" class="input-field" readonly/></div>
  </div>
</div>

    <br />

    <div class="container mt-5">
        <div class="bordere">
        <div class="row">
            <div class="col-md-8">   
                

                <div class="form-group row">
    <label for="txtUserGroup" class="col-sm-3 col-form-label">Code</label>
    <div class="col-sm-5">
        <asp:TextBox type="text" runat="server" id="txtCode" class="form-control" />
    </div>
</div>
    



                <div class="form-group row">
    <label for="txtShortName" class="col-sm-3 col-form-label">Short Name</label>
    <div class="col-sm-9">
        <asp:TextBox type="text" runat="server" id="txtShortName" class="form-control"/>
    </div>
</div>


                <div class="form-group row">
    <label for="txtFullName" class="col-sm-3 col-form-label">Full Name</label>
    <div class="col-sm-9">
        <asp:textbox type="text" runat="server" id="txtFulltName" class="form-control"/>
    </div>
</div>


                    <div class="form-group row">
    <label for="txtShortName" class="col-sm-3 col-form-label">Address Line 1 </label>
    <div class="col-sm-9">
        <asp:textbox type="text" runat="server" id="txtAddress1" class="form-control"/>
    </div>
</div>


                <div class="form-group row">
    <label for="txtFullName" class="col-sm-3 col-form-label">Address Line 2</label>
    <div class="col-sm-9">
        <asp:textbox type="text" runat="server" id="txtAddress2" class="form-control"/>
    </div>
</div>


                <div class="form-group row">
    <label for="txtUserName" class="col-sm-3 col-form-label">City / Region</label>
    <div class="col-sm-5">
        <asp:textbox type="text" runat="server" id="txtecity" class="form-control"/>
    </div>
</div>

                    <div class="form-group row">
    <label for="txtUserName" class="col-sm-3 col-form-label">Country</label>
    <div class="col-sm-5">
        <asp:textbox type="text" runat="server" id="txteCountry" class="form-control"/>
    </div>
</div>


        <div class="form-group row">
    <label for="txtUserName" class="col-sm-3 col-form-label">Telephone</label>
    <div class="col-sm-5">
        <asp:textbox type="text" runat="server" id="txtTelephone" class="form-control"/>
    </div>
</div>

                    <div class="form-group row">
    <label for="txtUserName" class="col-sm-3 col-form-label">Fax</label>
    <div class="col-sm-5">
        <asp:textbox type="text" runat="server" id="txteFax" class="form-control"/>
    </div>
</div>

                <div class="form-group row">
    <label for="txtUserName" class="col-sm-3 col-form-label">Mobile</label>
    <div class="col-sm-5">
        <asp:textbox type="text" runat="server" id="txteMobile" class="form-control"/>
    </div>
</div>

                <div class="form-group row">
    <label for="txtUserName" class="col-sm-3 col-form-label">Email</label>
    <div class="col-sm-9">
        <asp:textbox type="text" runat="server" id="txteEmail" class="form-control"/>
    </div>
</div>

                <div class="form-group row">
    <label for="txtUserName" class="col-sm-3 col-form-label">Contact Person</label>
    <div class="col-sm-9">
        <asp:textbox type="text" runat="server" id="txteContact" class="form-control"/>
    </div>
</div>

                <div class="form-group row">
    <label for="txtUserName" class="col-sm-3 col-form-label">Contact Details</label>
    <div class="col-sm-5">
        <asp:textbox type="text" runat="server" id="txteDetails" class="form-control"/>
    </div>
</div>

                <div class="form-group row">
    <label for="txtUserName" class="col-sm-3 col-form-label">Notes</label>
    <div class="col-sm-9">
        <input type="text" id="txteNotes" class="form-control"/>
    </div>
</div>   

                <div class="form-group row">
    <label for="txtUserStatus" class="col-sm-3 col-form-label">User Active Status</label>
    <div class="col-sm-3">
        <input type="text" id="txtUserStatus" class="form-control" readonly/>
    </div>
    <div class="col-sm-6">
        <asp:DropDownList id="ddlUserStatus" runat="server" class="form-control" onchange="updateUserStatusText()">
            <asp:ListItem value="A">Active</asp:ListItem>
            <asp:ListItem value="D">Deleted</asp:ListItem>
        </asp:DropDownList>
    </div>
</div>            
            </div>
        </div>

            <br />
            <br />

        <div class="row">
            <div class="col-md-6">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <button type="button" id="btnSave" class="btn btn-primary" style="width: 100px;">Save</button>
                <button type="button" id="btnBrowse" class="btn btn-secondary" style="width: 100px;">Browse</button>
                <button type="button" id="btnExit" class="btn btn-danger" style="width: 100px;">Exit</button>
            </div>
        </div>
    </div>

    <br />
    <hr />

    <footer>
                    <p>
                        &copy; <%: DateTime.Now.Year %> - Panaderia Inventory
                        Management system Powered By Cargills IT
                    </p>
                </footer>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Function to format a number to have two digits (e.g., 1 => "01")
        function formatNumber(number) {
            return number < 10 ? '0' + number : number;
        }

        // Function to get the current local date and time with AM/PM
        function getCurrentDateTime() {
            const now = new Date();
            const year = now.getFullYear();
            const month = formatNumber(now.getMonth() + 1); // Months are 0-based
            const day = formatNumber(now.getDate());
            const hours = formatNumber(now.getHours());
            const ampm = hours >= 12 ? 'PM' : 'AM'; // Determine AM or PM
            const twelveHour = hours > 12 ? hours - 12 : hours; // Convert to 12-hour format
            const minutes = formatNumber(now.getMinutes());
            const seconds = formatNumber(now.getSeconds());

            // Format the date and time as YYYY-MM-DD hh:mm:ss AM/PM
            return `${year}-${month}-${day} ${twelveHour}:${minutes}:${seconds} ${ampm}`;
        }

        // Function to set the date input field with the current date and time
        function setDateTimeField() {
            const dateTime = getCurrentDateTime();
            const dateField = document.getElementById('txtDate');
            dateField.value = dateTime;
        }

        // Call the function to set the date input field when the page loads
        window.onload = setDateTimeField;
    </script>

    <script>
        function updateUserGroupText() {
            var dropdown = document.getElementById("ddlUserGroup");
            var selectedText = dropdown.options[dropdown.selectedIndex].text;
            document.getElementById("txtUserGroup").value = selectedText;
        }

        function updateUserStatusText() {
            var dropdown = document.getElementById("ddlUserStatus");
            var selectedText = dropdown.options[dropdown.selectedIndex].text;
            document.getElementById("txtUserStatus").value = selectedText;
        }

        function updateDefaultStoreText() {
            var dropdown = document.getElementById("ddlDefaultStore");
            var selectedText = dropdown.options[dropdown.selectedIndex].text;
            document.getElementById("txtDefaultStore").value = selectedText;
        }
    </script>

    <script>
        // Function to get the current date and time in a formatted string
        function getCurrentDateTime() {
            var currentDate = new Date();
            var dateOptions = { year: 'numeric', month: '2-digit', day: '2-digit' };
            var timeOptions = { hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false };

            var formattedDate = currentDate.toLocaleDateString(undefined, dateOptions);
            var formattedTime = currentDate.toLocaleTimeString(undefined, timeOptions);

            return formattedDate + ' ' + formattedTime;
        }

        // Set the value of the "Country" input field to the current date and time
        document.getElementById('Country').value = getCurrentDateTime();
    </script>
</body>
</html>


