<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pur_Goods_Receive.aspx.cs" Inherits="Panaderia.Form.Inventory.Pur_Goods_Receive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title> Goods Receive</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!--Common CSS File -->
    <link href="../../Content/Inventory/Inventory.css" rel="stylesheet" media="screen"/>
    <link rel="stylesheet" href="../../Content/Navigation.css" media="screen" />
    <link rel="stylesheet" href="../../Content/Common.css" media="screen" />

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
      <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Company</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><input name="Company" type="text" id="company" class="input-field" /></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Date</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><input name="Country" type="text" id="Country" class="input-field" /></div>
       <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">Branch</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><input name="Branch" type="text" id="Branch" class="input-field" /></div>
      <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">Txn Typer</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><input name="TxnType" type="text" id="TxnType" class="input-field" /></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">Number</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><input name="Number" type="text" id="Number" class="input-field" /></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">User</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><input name="Code" type="text" id="Code" class="input-field" /></div>

    </div>
</div>

    <br />

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">


                <div class="form-group row">
                    <label for="txtSupplierVendor" class="col-sm-4 col-form-label">Supplier/Vendor</label>
                    <div class="col-sm-2">
                        <button for="txtsupplierVendor" class="auto-style328" style="background-color: #C0C0C0">...</button>
                    </div>
                    <div class="col-sm-2">
                        <input type="text" id="txtsupplier" class="auto-style327">
                    </div>
                    <div class="col-sm-2">
                        <label for="txtsupplier" class="auto-style400" style="background-color: #C0C0C0" width="120%"></label>
                    </div>

                </div>

                <div class="form-group row">
                    <label for="txtsup" class="col-sm-4 col-form-label"></label>
                    <div class="col-sm-8">
                        <input type="text" id="txtsup" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtamount" class="col-sm-4 col-form-label">Amount</label>
                    <div class="col-sm-8">
                        <input type="text" id="txtamount" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtadjustment" class="col-sm-4 col-form-label">Adjustment(+/-)</label>
                    <div class="col-sm-8">
                        <input type="text" id="txtadjustment" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtnetamount" class="col-sm-4 col-form-label">Net Amount</label>
                    <div class="col-sm-8">
                        <input type="text" id="txtnetamount" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtcomments" class="col-sm-4 col-form-label">Comments</label>
                    <div class="col-sm-8">
                        <input type="text" id="txtcomments" class="form-control">
                    </div>
                </div>
            </div>


            <div class="col-md-6">


                <div class="form-group row">
                    <label for="txtPONumber" class="col-sm-4 col-form-label">PO Number</label>
                    <div class="col-sm-2">
                        <button for="txtPONumber" class="auto-style328" style="background-color: #C0C0C0">...</button>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" id="txtPONumber" class="auto-style327">
                    </div>
                </div>


                <div class="form-group row">
                    <label for="txtInvoiceNo" class="col-sm-4 col-form-label">Invoice No</label>
                    <div class="col-sm-8">
                        <input type="text" id="txtInvoiceNo" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtInvoiceAmount" class="col-sm-4 col-form-label">Invoice Amount</label>
                    <div class="col-sm-8">
                        <input type="text" id="txtInvoiceAmount" class="form-control">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtInvoiceDate" class="col-sm-4 col-form-label">Invoice Date</label>
                    <div class="col-sm-8">
                        <input type="text" id="txtInvoiceDate" class="form-control">
                    </div>
                </div>

            </div>
        </div>
        <hr class="auto-style329" style="border-style: solid; color: #999999; background-color: #C0C0C0; width: 100%;" />
        <br />
        <div class="form-group row">
            <div id="Panel1" style="background-color: #faeeee; height: 358px; width: 727px;">
                <table class="auto-style44">
                    <tr>
                        <td class="auto-style35">
                            <input type="text" id="TextBox1" style="width: 35px;">
                        </td>
                        <td class="auto-style36">
                            <input type="text" id="TextBox2" style="width: 16px;">
                        </td>
                        <td class="auto-style37">
                            <input type="text" id="TextBox3" style="width: 81px;">
                        </td>
                        <td class="auto-style38">
                            <input type="text" id="TextBox4" style="width: 211px;">
                        </td>
                        <td class="auto-style39">
                            <input type="text" id="TextBox5" style="width: 65px;">
                        </td>                       
                        <td class="auto-style39">
                            <input type="text" id="TextBox7" style="width: 65px;">
                        </td>
                        <td class="auto-style41">
                            <input type="text" id="TextBox8" style="width: 65px;">
                        </td>
                        <td class="auto-style42">
                            <input type="text" id="TextBox9" style="width: 65px;">
                        </td>
                        <td class="auto-style43">
                            <input type="text" id="TextBox10" style="width: 75px;">
                        </td>
                        <td>
                            <button id="Button1" style="width: 46px;">+</button>
                        </td>
                    </tr>
                </table>
            </div>

        </div>

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
                
                <button type="button" id="btnSave" class="btn btn-primary" style="border-style: inset; width: 78px">Save</button>
                &nbsp;&nbsp;
                <button type="button" id="btnBrowse" class="btn btn-secondary" style="border-style: inset; width: 78px">Browse</button>
                &nbsp;&nbsp;
                <button type="button" id="btnExit" class="btn btn-danger" style="border-style: inset; width: 78px">Exit</button>
            

                
        
            </div>
        </div>
    </div>    


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
        function updatecate1Text() {
            var dropdown = document.getElementById("ddlcate1");
            var selectedText = dropdown.options[dropdown.selectedIndex].text;
            document.getElementById("txtcate1").value = selectedText;
        }

        function updateUserStatusText() {
            var dropdown = document.getElementById("ddlUserStatus");
            var selectedText = dropdown.options[dropdown.selectedIndex].text;
            document.getElementById("txtUserStatus").value = selectedText;
        }

        function updatetypeText() {
            var dropdown = document.getElementById("ddltype");
            var selectedText = dropdown.options[dropdown.selectedIndex].text;
            document.getElementById("txttype").value = selectedText;
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

        <br />
                <hr class="auto-style330" style="border-style: solid; background-color: #000000";width: 1125px; />
        
        <footer>
                    <p>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &copy; <%: DateTime.Now.Year %> - Panaderia Inventory
                        Management system Powered By Cargills IT
                    </p>
                </footer>


    </div>

     

</body>
</html>
