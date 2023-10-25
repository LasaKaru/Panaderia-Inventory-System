<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Follow_Up.aspx.cs" Inherits="Panaderia.Form.Tools.Follow_Up" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Purchase Goods Receiving </title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
     <!--Common CSS File -->
    <link rel="stylesheet" href="../../Content/tools.css" media="screen" />

</head>
<body>
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Inventory</a>
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Views</a>
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
                            <li><a href="../Reports/Report_Purchase.aspx">Purchase</>
                            </li>
                            <li><a href="../Reports/Report_Sales.aspx">Sales</a></li>
                            <li><a href="../Reports/Report_Analytics.aspx">Analytics</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Day Books</a>
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Accounts</a>
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
    <br />
    <br />
    <br />

    <form id="form1" runat="server">

    <div class="auto-style32">
        <div class="table-row">
            <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Serial Number</div>
            <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><input name="SerialNumber" type="text" id="SerialNumber" class="input-field" /></div>
            <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date</div>
            <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><input name="Country" type="text" id="Country" class="input-field" /></div>
            <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;User</div>
            <div class="table-cell" style="background-color: #eb1f10; width: 300px;">
                <asp:textbox name="User" runat="server" type="text" id="User" class="input-field" readonly/></div>
        </div>
    </div>
    <br />
    <br />
    
        <div>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group row">
                            <label for="txtUserName" class="col-sm-4 col-form-label">Code</label>
                            <div class="col-sm-8">
                                <input type="text" id="txtUserID" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtshortName" class="col-sm-4 col-form-label">Short Name</label>
                            <div class="col-sm-8">
                                <input type="text" id="txtshortName" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtfullrName" class="col-sm-4 col-form-label">Full Name</label>
                            <div class="col-sm-8">
                                <input type="text" id="txtfullName" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtCategory" class="col-sm-4 col-form-label">Category</label>
                            <div class="col-sm-8">
                                <select id="DropDownCategory" class="form-control name=" DropDownCategory" style="height: 30px; width: 214px;">
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtNotes" class="col-sm-4 col-form-label">Notes</label>
                            <div class="col-sm-8">
                                <input type="text" id="txttNotes" class="form-control">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="txtUserStatus" class="col-sm-4 col-form-label">Active Status</label>
                            <div class="col-sm-2">
                                <input type="text" id="txtUserStatus" class="auto-style326" readonly>
                            </div>
                            <div class="col-sm-6">
                                <select id="ddlUserStatus" class="auto-style327" onchange="updateUserStatusText()">
                                    <option value="A">Active</option>
                                    <option value="D">Deleted</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtStartDate" class="col-sm-2 col-form-label">Follow Up:</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtStartDate1" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </div>
                    <label for="txtEndDate" class="col-sm-1 col-form-label">Date To:</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="txtEndDate2" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                    </div>
                </div>
                <hr />
                <div class="form-group row">
                    <div id="Panel1" style="background-color: #faeeee; " class="auto-style328">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <table class="auto-style44">
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            </tr>
                        </table>
                        <!-- Display the generated report here -->
                        <div id="reportContainer" runat="server" class="mt-3">
                            <!-- The report content will be dynamically inserted here -->
                        </div>
                    </div>
                </div>
    
    <div class="row">
        <div class="col-md-6">
            <button type="button" id="btnSave" class="btn btn-primary" style="border-color: #000000; border-style: inset; width: 78px; background-color: #3333ffcc;">Save</button> &nbsp;&nbsp; <button type="button" id="btnExit" class="btn btn-danger" style="border-color: #000000; border-style: inset; width: 78px; background-color: #3333ffcc;">Browse</button> &nbsp;&nbsp; <button type="button" id="btnExit" class="btn btn-danger" style="border-color: #000000; border-style: inset; width: 78px; background-color: #3333ffcc;">Find</button> &nbsp;&nbsp; <button type="button" id="btnExit" class="btn btn-danger" style="border-color: #000000; border-style: inset; width: 78px; background-color: #3333ffcc;">Exit</button>
        </div>
    </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <div>
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

            function updateledgeraccountText() {
                var dropdown = document.getElementById("ddlledgeraccount");
                var selectedText = dropdown.options[dropdown.selectedIndex].text;
                document.getElementById("txtledgeraccount").value = selectedText;
            }
        </script>
        <script>
            // Function to get the current date and time in a formatted string
            function getCurrentDateTime() {
                var currentDate = new Date();
                var dateOptions = {
                    year: 'numeric',
                    month: '2-digit',
                    day: '2-digit'
                };
                var timeOptions = {
                    hour: '2-digit',
                    minute: '2-digit',
                    second: '2-digit',
                    hour12: false
                };
                var formattedDate = currentDate.toLocaleDateString(undefined, dateOptions);
                var formattedTime = currentDate.toLocaleTimeString(undefined, timeOptions);
                return formattedDate + ' ' + formattedTime;
            }
            // Set the value of the "Country" input field to the current date and time
            document.getElementById('Country').value = getCurrentDateTime();
        </script>
        <div>
        </div>
    </div>
    <hr />
    <footer>
        <p> &copy; <%: DateTime.Now.Year %> - Panaderia Inventory Management system Powered By Cargills IT </p>
    </footer>
</body>

</html>