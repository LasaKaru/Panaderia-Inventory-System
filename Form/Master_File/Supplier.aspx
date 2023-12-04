<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="Panaderia.Form.Master_File.Supplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title> MasterFiles - Supplier</title>

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

     <form id="form1" runat="server">

 

     <div class="auto-style32">

  <div class="table-row">

    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Serial Number</div>

    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="SerialNumber" runat="server" CssClass="input-field"></asp:TextBox></div>

    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Date</div>

    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="date" runat="server" CssClass="input-field"></asp:TextBox></div>

    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">User</div>

    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="user" runat="server" CssClass="input-field"></asp:TextBox></div>

  </div>

</div>

 

    <br />

 

 

 

 

 

<!--Ganeesha Put Your Code Here-->

 

      <div class="row">

            <div class="col-md-10 alignSuccessMessage">

            <div id="divMsg" visible="false" runat="server" class="alert alert-success fade-in">

                <asp:Label ID="lblShowMessage" runat="server" Visible="true"></asp:Label>

            </div>

                </div>

        </div>

 

 

    <div class="container mt-5">

        <div class="row">

            <div class="col-md-8">

 

 

 

                <div class="form-group row">

                    <label for="txtcode" class="col-sm-4 col-form-label">Code</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcode" runat="server" CssClass="form-control" />

                        <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtcode" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtname" class="col-sm-4 col-form-label">Supplier Name</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtname" runat="server" CssClass="form-control"></asp:TextBox> 

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtadd1" class="col-sm-4 col-form-label">Address Line 1</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtadd1" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtadd2" class="col-sm-4 col-form-label">Address Line 2</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtadd2" CssClass="form-control" runat="server"></asp:TextBox>                       

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtadd3" class="col-sm-4 col-form-label">Address Line 3</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtadd3" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtcountry" class="col-sm-4 col-form-label">Country</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcountry" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

                <br />

 

                <div class="form-group row">

                    <label for="txttele" class="col-sm-4 col-form-label">Telephone</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txttele" CssClass="form-control" runat="server"></asp:TextBox>

                        <asp:RegularExpressionValidator ID="revTelephone" runat="server" ControlToValidate="txttele" ValidationExpression="^\d{10}$" ErrorMessage="Please enter a 10-digit telephone number."

                            Display="Dynamic" ForeColor="Red" ValidationGroup="valGrpCreate" />

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtfax" class="col-sm-4 col-form-label">Fax</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtfax" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtmobile" class="col-sm-4 col-form-label">Mobile</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtmobile" CssClass="form-control" runat="server"></asp:TextBox>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtmobile" ValidationExpression="^\d{10}$" ErrorMessage="Please enter a 10-digit telephone number."

                            Display="Dynamic" ForeColor="Red" ValidationGroup="valGrpCreate" />

                    </div>

                </div>

 

 

                <div class="form-group row">

                    <label for="txtemail" class="col-sm-4 col-form-label">Email</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

                <br />

 

                <div class="form-group row">

                    <label for="txtcontactp1" class="col-sm-4 col-form-label">Contact Person 1</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcontactp1" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtcontactdetail1" class="col-sm-4 col-form-label">Contact Details</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcontactdetail1" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

                <br />

 

                <div class="form-group row">

                    <label for="txtcontactp2" class="col-sm-4 col-form-label">Contact Person 2</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcontactp2" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtcontactdetail2" class="col-sm-4 col-form-label">Contact Details</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcontactdetail2" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

                <br />

 

                <div class="form-group row">

                    <label for="txtcontactp3" class="col-sm-4 col-form-label">Contact Person 3</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcontactp3" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtcontactdetail3" class="col-sm-4 col-form-label">Contact Details</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcontactdetail3" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

                <br />

 

 

                <div class="form-group row">

                    <label for="txtnote" class="col-sm-4 col-form-label">Notes</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtnote" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtcreditlimit" class="col-sm-4 col-form-label">Credit Limit</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcreditlimit" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtcredperiod" class="col-sm-4 col-form-label">Credit Period</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtcreditperiod" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtLtime" class="col-sm-4 col-form-label">Lead Time</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtLtime" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

 

 

                <div class="form-group row">

                    <label for="txtsupType" class="col-sm-4 col-form-label">Supplier type</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtsupType" CssClass="auto-style326" runat="server" ReadOnly="true"></asp:TextBox>

                    </div>                   

                    <div class="col-sm-6">

                        <%--<select id="ddlsupType" class="auto-style327" runat="server" onchange="updateUserGroupText()">

                            <option value="1">Trade</option>

                            <option value="2">ServiCe</option>

                            <option value="3">Not Specify</option>

                        </select>--%>

 

                         <asp:DropDownList ID="ddlsupType" runat="server" onchange="updateUserGroupText()" Width="100px" CssClass="form-control">

                             <asp:ListItem Text="Trade" Value="1"></asp:ListItem>

                             <asp:ListItem Text="ServiCe" Value="2"></asp:ListItem>

                             <asp:ListItem Text="Not Specify" Value="3"></asp:ListItem>

                         </asp:DropDownList>

 

                    </div>

                </div>

                <br />

 

 

                <div class="form-group row">

                    <label for="txtbankBranch" class="col-sm-4 col-form-label">Bank & Branch</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtbankBranch" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtaccNo" class="col-sm-4 col-form-label">Account No</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtaccNo" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtaccName" class="col-sm-4 col-form-label">Name on Account</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtaccName" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtactiveStatus" class="col-sm-4 col-form-label">Active Status</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtactiveStatus" CssClass="auto-style326" runat="server" ReadOnly="true"></asp:TextBox>

                    </div>

                    <div class="col-sm-6">

                        <asp:DropDownList ID="ddlActiveStatus" runat="server" onchange="updateUserStatusText()" Width="114px" CssClass="form-control">

                             <asp:ListItem Text="Active" Value="A"></asp:ListItem>

                             <asp:ListItem Text="Deleted" Value="D"></asp:ListItem>                             

                         </asp:DropDownList>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtledgeraccount" class="col-sm-4 col-form-label">Ledger Account</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtledgeraccount" CssClass="auto-style326" runat="server" ReadOnly="true"></asp:TextBox>

                    </div>

                    <div class="col-sm-6">

                         <asp:DropDownList ID="ddlledgeraccount" runat="server" onchange="updateledgeraccountText()" Width="172px" CssClass="form-control">

                        <asp:ListItem Text="Account Payable" Value="1"></asp:ListItem>

                        <asp:ListItem Text="Electricity Payable" Value="2"></asp:ListItem>

                        <asp:ListItem Text="Water Bill Payable" Value="3"></asp:ListItem>

                        <asp:ListItem Text="Notes Payable" Value="4"></asp:ListItem>

                        <asp:ListItem Text="Salaries Payable" Value="5"></asp:ListItem>

                        <asp:ListItem Text="Rent Payable" Value="6"></asp:ListItem>

                        <asp:ListItem Text="Interest Payable" Value="7"></asp:ListItem>

                        <asp:ListItem Text="Uneaened Revenue" Value="8"></asp:ListItem>

                    </asp:DropDownList>

                    </div>         

                </div>

 

            </div>

 

            <div class="col-md-6">

 

 

                <div class="form-group row col-md-offset-5">

 

                    <input type="file" id="myFile" name="filename">

                </div>

            </div>

 

 

 

        </div>

    </div>

    <br />

    <br />

 

     <div class="row">
         <div class="col-md-6">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <asp:Button ID="btnSave" Text="Save" CssClass="btn btn-primary" ValidationGroup="valGrpCreate" OnClick="btnSave_Click" runat="server" Style="border-style: inset; width: 100px" />
             <button type="button" id="browseButton" class="btn btn-secondary" style="width: 100px;">Browse</button>
                <div id="myModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-content-container" style="overflow: auto">
                            <!-- Modal header with a close button -->
                            <div class="modal-header">
                                <h2>Supplier Details </h2>
                                <button id="closeModal">Clear Selection</button>
                            </div>
                            <!-- GridView -->
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True"></asp:GridView>

                            <!-- Placeholder for the GridView -->
                            <div id="gridViewPlaceholder"></div>
                        </div>
                    </div>
                </div>
             <asp:Button ID="btnExit" Text="Exit" CssClass="btn btn-danger" OnClick="btnExit_Click" runat="server" Style="border-style: inset; width: 100px" />
         </div>
     </div>
    

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   
    <div>

        <script>

            // JavaScript code to display data in the modal
            var browseButton = document.getElementById('browseButton');
            var modal = document.getElementById('myModal');
            var closeModalButton = document.getElementById('closeModal');
            var dataBody = document.getElementById('<%= GridView1.ClientID %>');
            var selectedRow = null;

            // Input fields
            var txtcodeInput = document.getElementById('txtcode');
            var txtnameInput = document.getElementById('txtname');
            var txtadd1Input = document.getElementById('txtadd1');
            var txtadd2Input = document.getElementById('txtadd2');
            var txtadd3Input = document.getElementById('txtadd3');
            var txttelenput = document.getElementById('txttele');


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
                txtcodeInput.value = cells[0].textContent;
                txtnameInput.value = cells[1].textContent;
                txtadd1Input.value = cells[2].textContent;
                txtadd2Input.value = cells[3].textContent;
                txtadd3Input.value = cells[4].textContent;
                txttelenput.value = cells[5].textContent;
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
        <br />

        <hr />
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

