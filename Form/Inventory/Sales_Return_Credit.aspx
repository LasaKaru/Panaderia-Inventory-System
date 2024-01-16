<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sales_Return_Credit.aspx.cs" Inherits="Panaderia.Form.Inventory.Sales_Return_Credit" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">   


     <style>
        .navbar-inverse.navbar-nav > li > a:focus, .navbar- inverse.navbar- nav > li > a:hover {
            color: #090a22;
            background-color: transparent;
        }

        .navbar-inverse {
            background-color: #ffffff;
            border-color: #ff0005;
        }

            .navbar-inverse .navbar-nav > li > a {
                color: #000000;
            }
    </style>

     <style type="text/css">

.table-row1 {
  display: table-row;
}

.table-cell1 {
  display: table-cell;
  padding: 10px;
  color: #FFFFFF;
}

.header {
  background-color: #0000;
}

.alignSuccessMessage{
    margin-left:90px;
}
.input-field1 {
  width: 100%;
  padding: 5px;
  border: none;
  background-color: #FFFFFF;
  color: #FFFFFF;
}
    </style>

    <style type="text/css">

        .auto-style32 {
            width: 50%;
            height: 53px;
        }
        </style>

     <style type="text/css">
               
        .table-container {
          display: table;
          width: 100%;
         }

        .table-row {
         display: table-row;
          }

         .table-cell {
           display: table-cell;
           padding: 10px;
          color: #FFFFFF;
          }

          .header {
           font-family: auto;
           background-color: #000000;
           }

           .input-field {
             width: 100%;
            padding: 5px;
            border: none;
            background-color: #FFFFFF;
            color: black;
            }
           .auto-style32 {
            display: table;
            width: 100%;
            }

    </style>

    <style>
        .bordered{
            width:800px;
            height:auto;
            padding:20px;
            border:1px solid black;
        }

        .row{
            width:auto;
            height:auto;

        }
    </style> 

    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 56px;
        }
        .auto-style4 {
            width: 46px;
            height: 26px;
        }
        .auto-style5 {
            width: 48px;
        }
        .auto-style6 {
            width: 57px;
        }
        .auto-style7 {
            width: 47px;
        }
        .auto-style9 {
            width: 32px;
            height: 26px;
        }
        .auto-style10 {
            width: 76px;
        }
    </style>

    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    

     <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>

    .navbar-inverse {
        background-color: #fffbfb;
        border-color: #fd0d0d;
    }

        .navbar-inverse.navbar-nav > li > a:focus, .navbar- inverse.navbar- nav > li > a:hover {
            color: #090a22;
            background-color: transparent;
        }

        .navbar-inverse .navbar-nav > li > a {
            color: #000000;
        }

            .navbar-inverse .navbar-nav > li > a:focus, .navbar-inverse .navbar-nav > li > a:hover {
                color: #0a0459;
                background-color: #d7cdcd;
            }

        .navbar-inverse .navbar-toggle .icon-bar {
            background-color: #101010;
        }
    .auto-style327 {
        display: block;
        width: 100%;
        height: 34px;
        padding: 6px 12px;
        color: #555;
        border: 1px solid #ccc;
        border-radius: 4px;       
    }

    </style>

    <style>
        .form-group row{

        }

        .form-group {
         margin-bottom: 5px;
          }

        col-sm-2 col-form-label{

        }
        </style>


    <style>

        .auto-style32 {
  margin: 0 auto;
}

        footer {
  text-align: center;
}

        
}
    </style>
 <style>
        /* Styles for the modal popup */
        .modal {
            display:;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.1);
            z-index: 1;
        }

        .modal-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
        }

        .modal-content-container {
            max-height: 600px; /* Adjust the maximum height as needed */
            overflow-y: auto;
        }
    </style>

    <style>
        /* Style for selected row */
        .selected-row {
            background-color: yellow;
        }
        </style> 
     <style>
        /* Styles for the modal popup */
        .modal1 {
            display:;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.1);
            z-index: 1;
        }

        .modal-content2 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
        }

        .modal-content-container2 {
            max-height: 600px; /* Adjust the maximum height as needed */
            overflow-y: auto;
        }
    </style>
    <style>
        /* Styles for the modal popup */
        .modal2 {
            display:;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.1);
            z-index: 1;
        }

        .modal-content3 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ccc;
        }

        .modal-content-container3 {
            max-height: 600px; /* Adjust the maximum height as needed */
            overflow-y: auto;
        }
    </style>

    <style>
        /* Style for selected row */
        .selected-row3 {
            background-color: yellow;
        }
    </style> 
//////

    <style>
        /* Style for selected row */
        .selected-row2 {
            background-color: yellow;
        }
        .auto-style336 {
            width: 58px;
        }
        .auto-style337 {
            width: 38px;
        }
        .auto-style339 {
            width: 74px;
        }
        .auto-style340 {
            height: 26px;
        }
        .auto-style342 {
            width: 58px;
            height: 26px;
        }
        .auto-style343 {
            width: 74px;
            height: 26px;
        }
        .auto-style344 {
            width: 48px;
            height: 26px;
        }
        .auto-style345 {
            width: 57px;
            height: 26px;
        }
        .auto-style346 {
            width: 47px;
            height: 26px;
        }
        .auto-style347 {
            width: 76px;
            height: 26px;
        }
        </style> 

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
                <img src="../../cargillstransparent.png" width="105" height="53" />
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
      <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Company</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="company" runat="server" CssClass="input-field" ReadOnly="True">1000</asp:TextBox></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Date</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="date" runat="server" CssClass="input-field" OnTextChanged="Country_TextChanged"></asp:TextBox></div>
       <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">Branch</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="Branch" runat="server" CssClass="input-field" ReadOnly="True">0001</asp:TextBox></div>
      <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">Txn Type</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="TxnType" runat="server" CssClass="input-field" ReadOnly="True">SRCR</asp:TextBox></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">Number</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="Number" runat="server" CssClass="input-field"></asp:TextBox></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">User</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="user" runat="server" CssClass="input-field"></asp:TextBox></div>

    </div>
</div>
    <br />

         <div class="row">
            <div class="col-md-10 alignSuccessMessage">
                <div id="divMsg" visible="false" runat="server" class="alert alert-success fade-in">
                    <asp:Label ID="lblShowMessage" runat="server" Visible="false"></asp:Label>
                </div>
            </div>
        </div>
    

    <div class="container mt-5">

        <div class="row">

            <div class="col-md-6">
 

                <div class="form-group row">

                    <label for="txtCustomer" class="col-sm-4 col-form-label">Customer</label>

                    
                    <div class="col-sm-2">
                            <!--<button for="btnsup" class="auto-style328" style="background-color: #C0C0C0">...</button>-->
                        <button type="button" id="btnCus" class="btn btn-secondary" class="auto-style328" style="border-color: #333333; background-color: #80808091">...</button>

                        <div id="myModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-content-container" style="overflow: auto">
                            <!-- Modal header with a close button -->
                            <div class="modal-header">
                                <h2>Customer</h2>
                                <button id="closeModal">Clear Selection</button>
                            </div>
                            <!-- GridView -->
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True"></asp:GridView>

                            <!-- Placeholder for the GridView -->
                            <div id="gridViewPlaceholder"></div>
                        </div>
                    </div>
                </div>
                        </div>

                    <div class="col-sm-2">
                        <asp:TextBox ID="txtCustomer" runat="server" CssClass="auto-style327"></asp:TextBox>
                    </div>


                     <div class="col-sm-2">
                        <asp:TextBox ID="txtcusCode" runat="server" CssClass="auto-style327"></asp:TextBox>
                    </div> 

                </div>    
 

                <div class="form-group row">

                    <label for="txtsup" class="col-sm-4 col-form-label"></label>

                    <div class="col-sm-8">
                        <asp:TextBox ID="txtcusName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                </div> 

                <div class="form-group row">

                    <label for="txtamount" class="col-sm-4 col-form-label">Amount</label>

                    <div class="col-sm-8">
                        <asp:TextBox ID="txtamount" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">

                    <label for="txtaDiscount" class="col-sm-4 col-form-label">Discount %</label>

                    <div class="col-sm-8">
                        <asp:TextBox ID="txtDiscount" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>              

                <div class="form-group row">

                    <label for="txtcomments" class="col-sm-4 col-form-label">Comments</label>

                    <div class="col-sm-8">
                        <asp:TextBox ID="txtcomments" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

            </div>
 

            <div class="col-md-6">
 

                <div class="form-group row">

                    <label for="txtInvoice" class="col-sm-4 col-form-label">Invoice NO</label>

                    <div class="col-sm-2">

                        <button type="button" id="btnSoNum" class="btn btn-secondary" class="auto-style328" style="border-color: #333333; background-color: #80808091">...</button>
                        <div id="myModal2" class="modal">
                    <div class="modal-content2">
                        <div class="modal-content-container2" style="overflow: auto">
                            <!-- Modal header with a close button -->
                            <div class="modal-header2">
                                <h2>Sales Invoice List</h2>
                                <button id="closeModal2">Clear Selection</button>
                            </div>
                            <!-- GridView -->
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="True"></asp:GridView>

                            <!-- Placeholder for the GridView -->
                            <div id="gridViewPlaceholder2"></div>
                        </div>
                    </div>
                </div> 

                    </div>

                    <div class="col-sm-2">
                        <asp:TextBox ID="txtInvoice" runat="server" CssClass="auto-style327"></asp:TextBox>
                    </div>
                    
                    <div class="col-sm-2">

                        <label for="txtInvoice" class="auto-style400" style="background-color: #C0C0C0" width="120%"></label>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtInvoiceamount" class="col-sm-4 col-form-label">Invoice Amount</label>

                    <div class="col-sm-8">
                        <asp:TextBox ID="txtInvoiceamount" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div> 

                <div class="form-group row">

                    <label for="txtInvoiceDate" class="col-sm-4 col-form-label">Invoice Date</label>

                    <div class="col-sm-8">
                        <asp:TextBox ID="txtInvoiceDate" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div> 

                 </div>
        </div>

        <hr class="auto-style329" style="border-style: solid; color: #999999; background-color: #C0C0C0; width: 100%;" />

        <br />

        <div id="Panel1" style="background-color: #ffa19926; height: auto; width: 1103px;">

         <div style="visibility: visible; overflow: auto; cursor: auto; display: table-column; clip: rect(auto, auto, auto, auto)">

                </asp:Panel>
         </div>
        <table class="nav-justified">
            <tr>

                <td class="auto-style340" colspan="2">
                     <button type="button" id="btnclick" class="btn btn-secondary" style="border-color: #333333; background-color: #8689cf4d; width: 12px; font-size: 9px;">...</button>
                                <div id="myModal3" class="modal">
                                    <div class="modal-content3">
                                        <div class="modal-content-container3" style="overflow: auto">
                                            <!-- Modal header with a close button -->
                                            <div class="modal-header2">
                                                <h2>Item Master List</h2>
                                                <button id="closeModal3">Clear Selection</button>
                                            </div>
                                            <!-- GridView -->
                                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="True"></asp:GridView>

                                            <!-- Placeholder for the GridView -->
                                            <div id="gridViewPlaceholder3"></div>
                                        </div>
                                    </div>
                                </div>
                    <strong>&nbsp;&nbsp;Line</strong></td>

                <th class="auto-style342"> </th>
                <td class="auto-style343"><strong>Item Code</strong></td>
                <td class="auto-style9"><strong>&nbsp; Descrition</strong></td>
                <td class="auto-style4"><strong>Price</strong></td>
                <td class="auto-style344"><strong>PSize</strong></td>
                <td class="auto-style345"><strong>Packs</strong></td>
                <td class="auto-style346"><strong>NOS</strong></td>
                <td class="auto-style347"><strong>Discount</strong></td>                
                <td class="auto-style347"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="95px"></asp:TextBox>
                </td>
                <td class="auto-style336">
                    <asp:TextBox ID="TextBox3" runat="server" Width="59px"></asp:TextBox>
                </td>
                <td class="auto-style339">
                    <asp:TextBox ID="TextBox2" runat="server" Width="75px" style="text-align: center"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox4" runat="server" style="text-align: center"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox5" runat="server" Width="66px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox6" runat="server" Width="57px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBox7" runat="server" Width="77px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" Width="63px"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" Width="77px"></asp:TextBox>
                </td>
               
                <td>
                    <asp:Button ID="Button2" runat="server" Text="+" Width="78px" OnClick="Button2_Click" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style337">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style336">&nbsp;</td>
                <td class="auto-style339">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>                
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" ShowFooter="True" AutoGenerateSelectButton="True" Height="139px" Width="823px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" HorizontalAlign="Justify" AutoGenerateDeleteButton="True" OnRowDeleting="GridView1_RowDeleting">
            <Columns>                
                <asp:BoundField DataField="Line" HeaderText="Line">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="item_code" HeaderText="Item_code">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="Description">
                <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="price" HeaderText="Price">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="psize" HeaderText="Psize">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="packs" HeaderText="packs">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="nos" HeaderText="nos">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="discount" HeaderText="Discount" SortExpression="discount">
                <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="Amount" HeaderText="Amount" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Right" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" HorizontalAlign="Right"/>
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Right" />
            <RowStyle BackColor="White" ForeColor="#330099" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" HorizontalAlign="Right" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        
        </asp:Panel>

            </div>
                <br />
                <br />
                <br />
                <br />

    <br />

    <br />

 

    <div class="form-group row">

                    <label for="txttotal" class="col-sm-6 col-form-label" style="border-width: thin; background-color: #FFFFFF": width:14px></label>

                    <div class="col-sm-50">                       

                        <input type="text" id="txttotal" class="auto-style326" style="width:116px">

                    </div>

                </div>

 

    <div class="row">

           <div class="col-md-6">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" style="border-style: inset; width: 100px" OnClick="btnSave_Click" />

    &nbsp;&nbsp;

    <asp:Button ID="btnPrint" runat="server" Text="Print" CssClass="btn btn-secondary" style="border-style: inset; width: 100px" OnClick="btnPrint_Click" />

    &nbsp;&nbsp;

    <asp:Button ID="btnExit" runat="server" Text="Exit" CssClass="btn btn-danger" style="border-style: inset; width: 100px" OnClick="btnExit_Click" />
</div>


        </div>

   

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  

        <script>
            // JavaScript code to display data in the modal
            var btnCus = document.getElementById('btnCus');
            var modal = document.getElementById('myModal');
            var closeModalButton = document.getElementById('closeModal');
            var dataBody = document.getElementById('<%= GridView1.ClientID %>');
            var selectedRow = null;

            // Input fields          

            var txtCustomerInput = document.getElementById('txtCustomer');
            var txtcusCodeInput = document.getElementById('txtcusCode');
            var txtcusNameInput = document.getElementById('txtcusName');
            //var txtSONumInput = document.getElementById('txtSONum');
            //var txtcommentsInput = document.getElementById('txtcomments');

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
                txtCustomerInput.value = cells[0].textContent;
                txtcusCodeInput.value = cells[1].textContent;
                txtcusNameInput.value = cells[2].textContent;

                //txtcommentsInput.value = cells[4].textContent;

            }

            btnCus.addEventListener('click', function () {
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

        <!--modal2-->

        <script>
            // JavaScript code to display data in the modal
            var btnSoNum = document.getElementById('btnSoNum');
            var modal2 = document.getElementById('myModal2');
            var closeModalButton2 = document.getElementById('closeModal2');
            var dataBody = document.getElementById('<%= GridView2.ClientID %>');
            var selectedRow2 = null;

            // Input fields   
            var txtCustomerInput = document.getElementById('txtCustomer');
            var txtcusCodeInput = document.getElementById('txtcusCode');
            var txtcusNameInput = document.getElementById('txtcusName');
            var txtDiscountInput = document.getElementById('txtDiscount');
            var txtInvoiceInput = document.getElementById('txtInvoice');
            var txtInvoiceamountInput = document.getElementById('txtInvoiceamount');
            var txtInvoiceDateInput = document.getElementById('txtInvoiceDate');



            // Function to handle row selection and highlight
            function selectRow2(row, rowData) {
                debugger;
                if (selectedRow2) {
                    selectedRow2.classList.remove('selected-row2');
                }
                row.classList.add('selected-row2');
                selectedRow2 = row;

                //closeModelButton.click();
                // Populate the input fields with the selected row's data
                var cells = row.cells;
                txtCustomerInput.value = cells[0].textContent;
                txtcusCodeInput.value = cells[1].textContent;
                txtcusNameInput.value = cells[2].textContent;
                txtDiscountInput.value = cells[3].textContent;
                txtInvoiceInput.value = cells[4].textContent;
                txtInvoiceamountInput.value = cells[5].textContent;
                txtInvoiceDateInput.value = cells[6].textContent;

            }

            btnSoNum.addEventListener('click', function () {
                // Display the modal when the button is clicked
                modal2.style.display = 'block';

                // Load data when the modal is opened
                loadModal2Data();
            });

            closeModalButton2.addEventListener('click', function () {
                // Close the modal when the "Close" button is clicked
                //dataBody.innerHTML = ''; // Clear the table content
                modal2.style.display = 'none';
            });

            window.addEventListener('click', function (event) {
                if (event.target == modal2) {
                    // Close the modal if the user clicks outside the modal content
                    //dataBody.innerHTML = '';
                    modal2.style.display = 'none';
                }
            });

            dataBody.addEventListener('click', function (event) {
                var target = event.target;
                if (target.tagName === 'TD') {
                    var row = target.parentElement;
                    selectRow2(row);
                }
            });

            function loadModal2Data() {
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
                $("#closeModal2").click(function () {
                    $("#myModal2").modal2("hide");
                });
            });

        </script> 
        
        <script>
            // JavaScript code to display data in the modal
            var btnclick = document.getElementById('btnclick');
            var modal3 = document.getElementById('myModal3');
            var closeModalButton3 = document.getElementById('closeModal3');
            var dataBody = document.getElementById('<%= GridView3.ClientID %>');
            var selectedRow3 = null;

            // Input fields   
            var txtitem_nuInput = document.getElementById('TextBox3');
            var txtcodeInput = document.getElementById('TextBox2');
            var txtDescriptionInput = document.getElementById('TextBox4');
            var txtPriceInput = document.getElementById('TextBox5');
            var txtPSizeInput = document.getElementById('TextBox6');
            var txtPascksInput = document.getElementById('TextBox7');
            var txtNosInput = document.getElementById('TextBox8');
            var txtDisInput = document.getElementById('TextBox9');

            // Function to handle row selection and highlight
            function selectRow3(row, rowData) {
                debugger;
                if (selectedRow3) {
                    selectedRow3.classList.remove('selected-row2');
                }
                row.classList.add('selected-row2');
                selectedRow3 = row;

                //closeModelButton.click();
                // Populate the input fields with the selected row's data
                var cells = row.cells;
                txtitem_nuInput.value = cells[0].textContent;
                txtcodeInput.value = cells[1].textContent;
                txtDescriptionInput.value = cells[2].textContent;
                txtPriceInput.value = cells[3].textContent;
                txtPSizeInput.value = cells[4].textContent;
                txtPascksInput.value = cells[5].textContent;
                txtNosInput.value = cells[6].textContent;
                txtDisInput.value = cells[7].textContent;
                txtAmount1Input.value = cells[8].textContent;

            }

            btnclick.addEventListener('click', function () {
                // Display the modal when the button is clicked
                modal3.style.display = 'block';

                // Load data when the modal is opened
                loadModal3Data();
            });

            closeModalButton3.addEventListener('click', function () {
                // Close the modal when the "Close" button is clicked
                //data.Body.innerHTML = ''; // Clear the table content
                modal3style.display = 'none';
            });

            window.addEventListener('click', function (event) {
                if (event.target == modal3) {
                    // Close the modal if the user clicks outside the modal content
                    //dataBody.innerHTML = '';
                    modal3.style.display = 'none';
                }
            });

            dataBody.addEventListener('click', function (event) {
                var target = event.target;
                if (target.tagName === 'TD') {
                    var row = target.parentElement;
                    selectRow3(row);
                }
            });

            function loadModal3Data() {
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
                $("#closeModal3").click(function () {
                    $("#myModal3").modal3("hide");
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

       </form>

        <footer>

                    <p>

                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        &copy; <%: DateTime.Now.Year %> - Panaderia Inventory

                        Management system Powered By Cargills IT

                    </p>

                </footer>


</body>

</html>