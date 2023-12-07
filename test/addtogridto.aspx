<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addtogridto.aspx.cs" Inherits="Panaderia.test.addtogridto" %>



<!DOCTYPE html>
<html lang="en">
<head>

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

    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title> Purchase Order</title>

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
        /* Style for selected row */
        .selected-row2 {
            background-color: yellow;
        }
        .auto-style331 {
            width: 59px;
        }
        .auto-style333 {
            height: 28px;
        }
        .auto-style335 {
            width: 1103px;
        }
        .auto-style338 {
            height: 28px;
            width: 44px;
        }
        .auto-style344 {
            width: 96px;
        }
        .auto-style345 {
            width: 27px;
        }
        .auto-style356 {
            width: 97px;
        }
        .auto-style357 {
            width: 81px;
        }
        .auto-style359 {
            width: 73px;
        }
        .auto-style363 {
            width: 86px;
        }
        .auto-style366 {
            width: 91px;
        }
        .auto-style368 {
            width: 95px;
        }
        .auto-style369 {
            width: 76px;
        }
        .auto-style370 {
            width: 72px;
        }
        .auto-style371 {
            width: 1100px;
        }
        .auto-style372 {
            width: 100px;
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
      <form id="form2" runat="server" >       
       <div class="auto-style32">
           <div class="table-row">
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Company</div>
            <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="company" runat="server" CssClass="input-field" ReadOnly="True">1000</asp:TextBox></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Date</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="date" runat="server" CssClass="input-field" ReadOnly="True"></asp:TextBox></div>

    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Branch</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="Branch" runat="server" CssClass="input-field" ReadOnly="True">0001</asp:TextBox></div>

    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Txn Type</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="TxnType" runat="server" CssClass="input-field" ReadOnly="True">PORD</asp:TextBox></div>

    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">Number</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="Number" runat="server" CssClass="input-field" ReadOnly="True"></asp:TextBox></div>

    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold;">User</div>
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

        <div class="bordere">
           

        <div class="row ">
            <div class="col-md-8 ">

                <div class="form-group row">
                    <label for="txtUserName" class="col-sm-4 col-form-label">Supplier</label>
                    <div class="col-sm-4">
                      <!--<button for="btnsup" class="auto-style328" style="background-color: #C0C0C0">...</button>-->
                        <button type="button" id="btnsup" class="btn btn-secondary" class="auto-style328" style="border-color: #333333; background-color: #80808091">...</button>

                        <div id="myModal" class="modal">
                    <div class="modal-content">
                        <div class="modal-content-container" style="overflow: auto">
                            <!-- Modal header with a close button -->
                            <div class="modal-header">
                                <h2>Supplier</h2>
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
                        <asp:TextBox ID="txtsupplier" runat="server" CssClass="auto-style327" TextMode="SingleLine"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtsupid" runat="server" CssClass="auto-style327" TextMode="SingleLine"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtsup" class="col-sm-4 col-form-label"></label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtsup" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                </div>
                <div class="form-group row">
                    <label for="txtunitsize" class="col-sm-4 col-form-label">Amount</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtreferance" class="col-sm-4 col-form-label">Supplier Referance</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtreferance" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="txtdiscount" class="col-sm-4 col-form-label">Discount</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtdiscount" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="txtcomments" class="col-sm-4 col-form-label">Comments</label>
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtcomments" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>      
                <br />



    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Row to GridView</title>   

    <div>

         <div class="form-group row">
                    <div id="Panel1" style="background-color: #ffa19926; height: 358px; width: 1103px;">
                        <div class="col-sm-4">
                            
                            </div>

                         <table id="GridView1" class="auto-style335">
                <thead>
                <tr>

                    <td class="auto-style338">
                        <button type="button" id="btnclick" class="btn btn-secondary"   style="border-color: #333333; background-color: #8689cf4d; width: 40px; font-size: 9px;">...</button>
                                    <div id="myModal2" class="modal">
                                        <div class="modal-content2">
                                            <div class="modal-content-container2" style="overflow: auto">
                                                <!-- Modal header with a close button -->
                                                <div class="modal-header2">
                                                    <h2>Item Master List</h2>
                                                    <button id="closeModal2">Clear Selection</button>
                                                </div>
                                                <!-- GridView -->
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="True"></asp:GridView>

                                                <!-- Placeholder for the GridView -->
                                                <div id="gridViewPlaceholder2"></div>
                                            </div>
                                        </div>
                                    </div>
        
       
         </td>

                    <th class="auto-style345">Line</th>
                    <th class="auto-style368"> </th>
                    <th class="auto-style359">Item code</th>
                    <th class="auto-style370">Description</th>
                    <th class="auto-style363">Price</th>
                    <th class="auto-style369">PSize</th>
                    <th class="auto-style357">Packs</th>
                    <th class="auto-style356">Nos</th>
                    <th class="auto-style366">Discount</th>
                    <th class="auto-style344">Amount</th>
                    
                </tr>
               </thead>
               </div>
            <br />           
           <tbody>
           </tbody>
           </table>



        
<table id="yourGridViewTable" class="auto-style371">
    <tr>
        <!-- Your input fields here  
         <td class="auto-style333">
                        <button type="button" id="btnclick" class="btn btn-secondary"   style="border-color: #333333; background-color: #8689cf4d; width: 62px; font-size: 9px;">...</button>
                                    <div id="myModal2" class="modal">
                                        <div class="modal-content2">
                                            <div class="modal-content-container2" style="overflow: auto">
                                                <!-- Modal header with a close button 
                                                <div class="modal-header2">
                                                    <h2>Item Master List</h2>
                                                    <button id="closeModal2">Clear Selection</button>
                                                </div>
                                                <!-- GridView 
                                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="True"></asp:GridView>

                                                <!-- Placeholder for the GridView 
                                                <div id="gridViewPlaceholder2"></div>
                                            </div>
                                        </div>
                                    </div>
        
       
         </td>-->
        <td class="auto-style333">
            <asp:TextBox ID="txtitem_nu" runat="server" CssClass="auto-style331" style="width: 100px"></asp:TextBox>
        </td>

        <td class="auto-style333">
            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style331" style="width: 100px">1</asp:TextBox>
        </td>

        <td class="auto-style333">
            <asp:TextBox ID="txtcode" runat="server" CssClass="auto-style331" style="width: 100px"></asp:TextBox>
        </td>

        <td class="auto-style333">
            <asp:TextBox ID="txtDescription" runat="server" CssClass="auto-style331" style="width: 154px"></asp:TextBox>
        </td>

        <td class="auto-style333">
            <asp:TextBox ID="txtPrice" runat="server" CssClass="auto-style331" style="width: 100px"></asp:TextBox>
        </td>

        <td class="auto-style333">
            <asp:TextBox ID="txtPSize" runat="server" CssClass="auto-style331" style="width: 100px"></asp:TextBox>
        </td>

        <td class="auto-style333">
            <asp:TextBox ID="txtPascks" runat="server" CssClass="auto-style331" style="width: 100px"></asp:TextBox>
        </td>

        <td class="auto-style333">
            <asp:TextBox ID="txtNos" runat="server" CssClass="auto-style331" style="width: 100px"></asp:TextBox>
        </td>

        <td class="auto-style333">
            <asp:TextBox ID="txtDis" runat="server" CssClass="auto-style331" style="width: 100px"></asp:TextBox>
        </td>

        <td class="auto-style333">
            <asp:TextBox ID="txtAmount" runat="server" CssClass="auto-style331" style="width: 100px"></asp:TextBox>
        </td>
        <!-- ... (repeat for other input fields) -->
      <td class="auto-style333">
    <button type="button" id="Button2" style="width: 46px" onclick="addRowToGridView()">+</button>
</td>


    </tr>

</table> 
                        </div>
        
 </div>    
    
    <div style="visibility: visible; overflow: auto; cursor: auto; display: table-column; clip: rect(auto, auto, auto, auto)">
            <asp:GridView ID="yourGridView" runat="server" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" ForeColor="Black" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="yourGridView_SelectedIndexChanged" AutoGenerateDeleteButton="True" >
                <Columns>
                    <asp:BoundField HeaderText="item num1" DataField="txtitem_nu1" Visible="true" />
                    <asp:BoundField HeaderText="item num" DataField="txtitem_nu" Visible="true" />
                    <asp:BoundField HeaderText="Box2" DataField="TextBox2" Visible="true" />
                    <asp:BoundField HeaderText="code" DataField="txtcode" Visible="true"/>
                    <asp:BoundField HeaderText="Description" DataField="txtDescription" Visible="true" />
                    <asp:BoundField HeaderText="Price" DataField="txtPrice" Visible="true" />
                    <asp:BoundField HeaderText="PSize" DataField="txtPSize" Visible="true" />
                    <asp:BoundField HeaderText="Pascks" DataField="txtPascks" Visible="true" />
                    <asp:BoundField HeaderText="Nos" DataField="txtNos" Visible="true" />
                    <asp:BoundField HeaderText="Discount" DataField="txtDis" Visible="true"/>
                    <asp:BoundField HeaderText="Amount" DataField="txtAmount" Visible="true"/>

                </Columns>
                <RowStyle BorderStyle="Solid" HorizontalAlign="Center" />
                <SelectedRowStyle BorderStyle="Dotted" />
            </asp:GridView>
    </div>

    <br />
    <br />

    <div class="row">
        <div class="col-md-6">

            <!--<button id="btnSave" text="Save" cssclass="btn btn-primary" style="border-style: inset; " onclick="saveDataToServer()" class="auto-style372">Save</button>-->
            &nbsp;


        <asp:Button ID="SaveAndPrintButton" runat="server" Text="Save and Print" CssClass="btn btn-primary" OnClick="SaveAndPrintButton_Click" style="border-style: inset; width: 100px" />
        <br/>

            <div class="form-group row">
                <label for="txttotal" class="col-sm-6 col-form-label" style="border-width: thin; background-color: #FFFFFF": width:14px></label>
                <div class="col-sm-50">
                    &nbsp; <input type="text" id="txttotal" class="auto-style326" style="width: 116px"></div>
            </div>



        </div>
    </div>

    </form>

    <script>
        function addRowToGridView() {
            // Get reference to the table
            var table = document.getElementById("yourGridViewTable");

            // Create a new row
            var newRow = table.insertRow(table.rows.length);

            // Array to store input field IDs
            var inputIds = ["txtitem_nu", "TextBox2", "txtcode", "txtDescription", "txtPrice", "txtPSize", "txtPascks", "txtNos", "txtDis", "txtAmount"];

            // Loop through input fields and add cells to the new row
            for (var i = 0; i < inputIds.length; i++) {
                var cell = newRow.insertCell(i);
                var inputValue = document.getElementById(inputIds[i]).value;
                cell.innerHTML = inputValue;
            }
        }

        function saveDataToServer() {
            // Get reference to the table
            var table = document.getElementById("yourGridViewTable");

            // Array to store data from the table
            var tableData = [];

            // Loop through rows in the table
            for (var i = 1; i < table.rows.length; i++) {
                var rowData = [];
                // Loop through cells in the row
                for (var j = 0; j < table.rows[i].cells.length; j++) {
                    rowData.push(table.rows[i].cells[j].innerHTML);
                }
                tableData.push(rowData);
            }

            // Use AJAX to send data to the server
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "Pur_Purchase_Order.aspx/SaveData", true);
            xhr.setRequestHeader("Content-Type", "application/json");

            // Convert the array to JSON
            var jsonData = JSON.stringify({ tableData: tableData });

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Handle the response from the server if needed
                    console.log('Data saved to server:', xhr.responseText);

                    // Refresh the GridView after saving data
                    //refreshGridView();
                }
            };

            xhr.send(jsonData);
        }

        function refreshGridView() {
            // Use AJAX to refresh the GridView
            var gridView = $("[id$='yourGridView']");
            gridView.empty();

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "Pur_Purchase_Order.aspx/GetData", true);
            xhr.setRequestHeader("Content-Type", "application/json");

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // Parse the JSON response
                    var data = JSON.parse(xhr.responseText);

                    // Bind the data to the GridView
                    gridView.append(data.d);
                }
            };

            xhr.send();
        }
    </script>

    <script>
        // JavaScript code to display data in the modal
        var btnsup = document.getElementById('btnsup');
        var modal = document.getElementById('myModal');
        var closeModalButton = document.getElementById('closeModal');
        var dataBody = document.getElementById('<%= GridView3.ClientID %>');
        var selectedRow = null;

        // Input fields          

        var txtsupplierInput = document.getElementById('txtsupplier');
        var txtsupidInput = document.getElementById('txtsupid');
        var txtsupInput = document.getElementById('txtsup');
        //var txtnetamountInput = document.getElementById('txtnetamount');
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
            txtsupplierInput.value = cells[0].textContent;
            txtsupidInput.value = cells[1].textContent;
            txtsupInput.value = cells[2].textContent;
            //txtnetamountInput.value = cells[3].textContent;
            //txtcommentsInput.value = cells[4].textContent;

        }

        btnsup.addEventListener('click', function () {
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
            var btnclick = document.getElementById('btnclick');
            var modal2 = document.getElementById('myModal2');
            var closeModalButton2 = document.getElementById('closeModal2');
            var dataBody = document.getElementById('<%= GridView2.ClientID %>');
            var selectedRow2 = null;

            // Input fields   
            var txtitem_nuInput = document.getElementById('txtitem_nu');
            var txtcodeInput = document.getElementById('txtcode');
            var txtDescriptionInput = document.getElementById('txtDescription');
            var txtPriceInput = document.getElementById('txtPrice');
            var txtPSizeInput = document.getElementById('txtPSize');
            var txtPascksInput = document.getElementById('txtPascks');
            var txtNosInput = document.getElementById('txtNos');
            var txtDisInput = document.getElementById('txtDis');
            var txtAmountInput = document.getElementById('txtAmount');




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
                txtitem_nuInput.value = cells[0].textContent;
                txtcodeInput.value = cells[1].textContent;
                txtDescriptionInput.value = cells[2].textContent;
                txtPriceInput.value = cells[3].textContent;
                txtPSizeInput.value = cells[4].textContent;
                txtPascksInput.value = cells[5].textContent;
                txtNosInput.value = cells[6].textContent;
                txtDisInput.value = cells[7].textContent;
                txtAmountInput.value = cells[8].textContent;

            }

            btnclick.addEventListener('click', function () {
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


                
</body>
</html>
