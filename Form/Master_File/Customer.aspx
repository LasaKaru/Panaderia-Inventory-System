<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer.aspx.cs" Inherits="Panaderia.Form.Master_File.Customer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Masterfiles - Customer</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
    
    <!--Common CSS File -->
    <link href="../../Content/Masterfiles/Master.css" rel="stylesheet" media="screen"/>
    <link href="../../Content/BrowseModal.css" rel="stylesheet" media="screen"/>


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

    

<br />
<br />

<br />

     <form id="form2" runat="server"> 

     <div class="auto-style32">
  <div class="table-row">
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Serial Number</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="SerialNumber" runat="server" CssClass="input-field"></asp:TextBox></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Date</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px; color:#000;"><asp:TextBox ID="date" runat="server" CssClass="input-field"></asp:TextBox></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">User</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="user" runat="server" CssClass="input-field"></asp:TextBox></div>
  </div>
</div>

    <br />





<!--Ganeesha Put Your Code Here-->


   
         <div class="row">
            <div class="col-md-4 alignSuccessMessage">
            <div id="divMsg" visible="false" runat="server" class="alert alert-success fade-in">
                <asp:Label ID="lblShowMessage" runat="server" Visible="true"></asp:Label>
            </div>
                </div>
        </div>


    <div class="container mt-5" >
        <div class="row">
            <div class="col-md-8">
                              
                <div class="form-group row">
                    <label for="txtCode" class="col-sm-4 col-form-label">Code</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtcode" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>
                    </div>
                </div>



                <div class="form-group row">
    <label for="txtName" class="col-sm-4 col-form-label">Customer Name</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtAddress1" class="col-sm-4 col-form-label">Address Line 1</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtAddress1" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtAddress2" class="col-sm-4 col-form-label">Address Line 2</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtAddress2" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtAddress3" class="col-sm-4 col-form-label">Address Line 3</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtAddress3" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtcountry" class="col-sm-4 col-form-label">Country</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtcountry" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<br />
<div class="form-group row">
    <label for="txtTele" class="col-sm-4 col-form-label">Telephone</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtTele" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RegularExpressionValidator ID="revTelephone" runat="server" ControlToValidate="txtTele" ValidationExpression="^\d{10}$" ErrorMessage="Please enter a 10-digit telephone number." Display="Dynamic" ForeColor="Red" ValidationGroup="valGrpCreate" />
    </div>
</div>
<div class="form-group row">
    <label for="txtfax" class="col-sm-4 col-form-label">Fax</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtfax" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtmobile" class="col-sm-4 col-form-label">Mobile</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmobile" ValidationExpression="^\d{10}$" ErrorMessage="Please enter a 10-digit telephone number." Display="Dynamic" ForeColor="Red" ValidationGroup="valGrpCreate" />
    </div>
</div>
<div class="form-group row">
    <label for="txtemail" class="col-sm-4 col-form-label">Email</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtemail" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<br />
<div class="form-group row">
    <label for="txtcontactp1" class="col-sm-4 col-form-label">Contact Person</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtcontactp1" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtcontactdetail" class="col-sm-4 col-form-label">Contact Details</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtcontactdetail" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<br />
<div class="form-group row">
    <label for="txtNote" class="col-sm-4 col-form-label">Notes</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtNote" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtcreditlimit" class="col-sm-4 col-form-label">Credit Limit</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtcreditlimit" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtcredperiod" class="col-sm-4 col-form-label">Credit Period</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtcreditperiod" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtCusType" class="col-sm-4 col-form-label">Customer type</label>
    <div class="col-sm-2">
        <asp:TextBox ID="txtCusType" runat="server" CssClass="auto-style326" ReadOnly="true"></asp:TextBox>
    </div>
    <div class="col-sm-6">
        <asp:DropDownList ID="dd1custype" runat="server" onchange="updateUsertypeText()" Width="114px" CssClass="form-control">
            <asp:ListItem Text="Cash" Value="1"></asp:ListItem>
            <asp:ListItem Text="Credit" Value="2"></asp:ListItem>
        </asp:DropDownList>
    </div>
</div>
<br />
<div class="form-group row">
    <label for="txtvat" class="col-sm-4 col-form-label">Customer Vat No</label>
    <div class="col-sm-8">
        <asp:TextBox ID="txtVatNo" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
</div>
<div class="form-group row">
    <label for="txtUserStatus" class="col-sm-4 col-form-label">Active Status</label>
    <div class="col-sm-2">
        <asp:TextBox ID="txtUserStatus" runat="server" CssClass="auto-style326" ReadOnly="true"></asp:TextBox>
    </div>
    <div class="col-sm-6">
        <asp:DropDownList ID="ddlActiveStatus" runat="server" onchange="updateUserStatusText()" Width="114px" CssClass="form-control">
            <asp:ListItem Text="Active" Value="A"></asp:ListItem>
            <asp:ListItem Text="Deleted" Value="D"></asp:ListItem>
        </asp:DropDownList>
    </div>
</div>
</div>
<div class="col-md-6">
    
</div>
</div>
</div>
<br />
<br />
<div class="row">
    <div class="col-md-10"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       
        
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" Style="width: 100px" ValidationGroup="valGrpCreate" OnClick="btnSave_Click" />
        <button type="button" id="browseButton" class="btn btn-secondary" style="width: 100px;">Browse</button>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <div class="modal-content-container" style="overflow: auto">
                    <!-- Modal header with a close button -->
                    <div class="modal-header">
                        
                        <h2>Customer Details </h2>
                        <button id="closeModal">Clear Selection</button>
                    </div>
                    <!-- GridView -->
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True"></asp:GridView>
                    <!-- Placeholder for the GridView -->
                    <div id="gridViewPlaceholder"></div>
                </div>
            </div>
        </div>
        <asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="btn btn-danger" Style="width: 100px" OnClick="btnExit_Click" />
    </div>
</div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
    <div>

        <script>
            document.getElementById("btnExit").addEventListener("click", function () {
                window.location.href = "../../Dashboard.aspx";
            });
        </script>

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
            document.getElementById("txtCusType").value = selectedText;
        }

        function updateUsertypeText() {
            var dropdown = document.getElementById("dd1custype");
            var selectedText = dropdown.options[dropdown.selectedIndex].text;
            document.getElementById("txtCusType").value = selectedText;
        }

        function updateUserStatusText() {
            var dropdown = document.getElementById("ddlActiveStatus");
            var selectedText = dropdown.options[dropdown.selectedIndex].text;
            document.getElementById("txtUserStatus").value = selectedText;
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

        <script>
            // JavaScript code to display data in the modal
            var browseButton = document.getElementById('browseButton');
            var modal = document.getElementById('myModal');
            var closeModalButton = document.getElementById('closeModal');
            var dataBody = document.getElementById('<%= GridView1.ClientID %>');
            var selectedRow = null;

            // Input fields
            var txtCodeInput = document.getElementById('txtCode');
            var txtTeleInput = document.getElementById('txtTele');
            var txtmobileInput = document.getElementById('txtmobile');
            var txtaddress1Input = document.getElementById('txtAddress1');
            var txtaddress2Input = document.getElementById('txtAddress2');
            var txtaddress3Input = document.getElementById('txtAddress3');
            var txtcontryInput = document.getElementById('txtcountry');
            var txtemailInput = document.getElementById('txtemail');
            var txtcreditlimitInput = document.getElementById('txtcreditlimit');
            var txtuserStatusInput = document.getElementById('txtUserStatus');
            // Function to handle row selection and highlight
            function selectRow(row, rowData) {
                debugger;
                if (selectedRow) {
                    selectedRow.classList.remove('selected-row');
                }
                row.classList.add('selected-row');
                selectedRow = row;
                //closeModelButton.click();
                // Populate the input fields with the selected row's data
                var cells = row.cells;
                txtCodeInput.value = cells[0].textContent;
                txtTeleInput.value = cells[1].textContent;
                txtmobileInput.value = cells[2].textContent;
                txtaddress1Input.value = cells[3].textContent;
                txtaddress2Input.value = cells[4].textContent;
                txtaddress3Input.value = cells[5].textContent;
                txtcontryInput.value = cells[6].textContent;
                txtemailInput.value = cells[7].textContent;
                txtcreditlimitInput.value = cells[8].textContent;
                txtuserStatusInput.value = cells[9].textContent;
            }

            browseButton.addEventListener('click', function () {
                // Display the modal when the button is clicked
                modal.style.display = 'block';
                // Load data when the modal is opened
                loadModalData();
            });

            closeModalButton.addEventListener('click', function () {
                // Close the modal when the "Close" button is clicked
                //dataBody.innerHTML = ''; // Clear the table content
                modal.style.display = 'none';
            });

            window.addEventListener('click', function (event) {
                if (event.target == modal) {
                    // Close the modal if the user clicks outside the modal content
                    //dataBody.innerHTML = '';
                    modal.style.display = 'none';
                }
            });

            dataBody.addEventListener('click', function (event) {
                var target = event.target;
                if (target.tagName === 'TD') {
                    var row = target.parentElement;
                    selectRow(row);
                }
            });

            function loadModalData() {
                // Add code here to load data into the modal (e.g., from the GridView)
                // Make an AJAX request to fetch data and populate the modal
                var xmlhttp = new XMLHttpRequest();
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                        // Parse the response and populate the modal
                        var data = JSON.parse(xmlhttp.responseText);
                       // Implement code to populate the modal with data
                    }
                };

                // Replace 'GetDataUrl' with the URL to fetch data from the server
                xmlhttp.open('GET', 'GetDataUrl', true);
                xmlhttp.send();
            }

            $(document).ready(function () {
                $("#closeModal").click(function () {
                    $("#myModal").modal("hide");
                });
            });

        </script>

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

        </div>
         

        <br />
        <br />
       
        </form>

        <footer>
                    <p>
                        &copy; <%: DateTime.Now.Year %> - Panaderia Inventory
                        Management system Powered By Cargills IT
                    </p>
                </footer>


    </div>

     

</body>
</html>