<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="Panaderia.Form.Views.Inventory" %>



<%@ Register assembly="FastReport.Web" namespace="FastReport.Web" tagprefix="cc1" %>



<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Inventory </title>

    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Bootstrap JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

     <!--Common CSS File -->
    <link rel="stylesheet" href="../../Content/Navigation.css" media="screen" />
    <link rel="stylesheet" href="../../Content/Common.css" media="screen" />

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

        <div>
        
            <div class="container mt-5">
    <div class="row">
        <div class="col-md-6">
            
                                            
        </div>
    </div>
             
                <div class="form-group row">
        <label for="txtStartDate" class="col-sm-2 col-form-label" style="font-family: math;">Inventory Balance as at :</label>
        <div class="col-sm-3">
            <asp:TextBox ID="txtStartDate1" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
             

        <div>
                    <asp:Button ID="Button1" runat="server" Text="Load Balance" OnClick="btnGenerateReport_Click" CssClass="btn btn-primary" />
            <asp:Button ID="Button2" runat="server" Text="Print" OnClick="btnGenerateReport1_Click" CssClass="btn btn-primary" />
            
                </div>


    </div>                   
    <hr />


                <div class="form-group row" runat="server">

                   <div id="Panel1" style="background-color: #faeeee; height: 100%; width:100%;">
                       <br />
                       <asp:GridView ID="GridView" runat="server">
        </asp:GridView>
                       <br />
                       <!--
                       -->
                       <br />



                       <br />

                       <cc1:WebReport ID="WebReport1" runat="server" ReportResourceString="77u/PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjxSZXBvcnQgU2NyaXB0TGFuZ3VhZ2U9IkNTaGFycCIgUmVwb3J0SW5mby5DcmVhdGVkPSIxMC8xOC8yMDIzIDA5OjA1OjUwIiBSZXBvcnRJbmZvLk1vZGlmaWVkPSIxMC8xOC8yMDIzIDE2OjA2OjI2IiBSZXBvcnRJbmZvLkNyZWF0b3JWZXJzaW9uPSIyMDIzLjMuNi4wIj4NCiAgPERpY3Rpb25hcnk+DQogICAgPE1zU3FsRGF0YUNvbm5lY3Rpb24gTmFtZT0iQ29ubmVjdGlvbiIgQ29ubmVjdGlvblN0cmluZz0icmlqY21scW5kR21IZU5FaGpoelgrNzVOckZuQko0Um9FL2hNNzFwcHFqNVV6cnNsOVNMNGtiZThYbHpDdDlCdjNWbjRKT1dER0lncXVZZVdMTTJ6ajhabGQwbC9XVVloeVNTWDdtaVAyVEdnbWk1bjdMRlNQUWhBbXozOWVBanNVUVFRT3IvK0JqdlY2bzNaTTBVQkU5cE1DZFBCKzYzdnVDRlBpQjJqN2pEb2hwS1I1MGo2dTZINXhyT2h1U21HVEh3Tk5pbjdWRktFUG5JZ0d6NkFLZ08wcVRSR0E9PSI+DQogICAgICA8VGFibGVEYXRhU291cmNlIE5hbWU9IlRYX0ludmVudG9yeSIgRGF0YVR5cGU9IlN5c3RlbS5JbnQzMiIgRW5hYmxlZD0idHJ1ZSIgVGFibGVOYW1lPSJUWF9JbnZlbnRvcnkiPg0KICAgICAgICA8Q29sdW1uIE5hbWU9IlR4bl9JZCIgRGF0YVR5cGU9IlN5c3RlbS5JbnQ2NCIvPg0KICAgICAgICA8Q29sdW1uIE5hbWU9IkNvbXBhbnlfSUQiIERhdGFUeXBlPSJTeXN0ZW0uU3RyaW5nIi8+DQogICAgICAgIDxDb2x1bW4gTmFtZT0iQnJhbmNoX0lkIiBEYXRhVHlwZT0iU3lzdGVtLlN0cmluZyIvPg0KICAgICAgICA8Q29sdW1uIE5hbWU9IlR4bl9UeXBlIiBEYXRhVHlwZT0iU3lzdGVtLlN0cmluZyIvPg0KICAgICAgICA8Q29sdW1uIE5hbWU9IlR4bl9OdW1iZXIiIERhdGFUeXBlPSJTeXN0ZW0uRGVjaW1hbCIvPg0KICAgICAgICA8Q29sdW1uIE5hbWU9IlR4bl9EYXRlIiBEYXRhVHlwZT0iU3lzdGVtLkRhdGVUaW1lIi8+DQogICAgICAgIDxDb2x1bW4gTmFtZT0iSXRlbV9ObyIgRGF0YVR5cGU9IlN5c3RlbS5JbnQ2NCIvPg0KICAgICAgICA8Q29sdW1uIE5hbWU9IkJhdGNoX05vIiBEYXRhVHlwZT0iU3lzdGVtLlN0cmluZyIvPg0KICAgICAgICA8Q29sdW1uIE5hbWU9IkV4cF9EYXRlIiBEYXRhVHlwZT0iU3lzdGVtLkRhdGVUaW1lIi8+DQogICAgICAgIDxDb2x1bW4gTmFtZT0iVHhuX1ByaWNlIiBEYXRhVHlwZT0iU3lzdGVtLkRlY2ltYWwiLz4NCiAgICAgICAgPENvbHVtbiBOYW1lPSJUeG5fUXR5X0luIiBEYXRhVHlwZT0iU3lzdGVtLkRlY2ltYWwiLz4NCiAgICAgICAgPENvbHVtbiBOYW1lPSJUeG5fUXR5X091dCIgRGF0YVR5cGU9IlN5c3RlbS5EZWNpbWFsIi8+DQogICAgICAgIDxDb2x1bW4gTmFtZT0iU1VzZXIiIERhdGFUeXBlPSJTeXN0ZW0uU3RyaW5nIi8+DQogICAgICAgIDxDb2x1bW4gTmFtZT0iU0RhdGUiIERhdGFUeXBlPSJTeXN0ZW0uRGF0ZVRpbWUiLz4NCiAgICAgICAgPENvbHVtbiBOYW1lPSJTVGltZSIgRGF0YVR5cGU9IlN5c3RlbS5TdHJpbmciLz4NCiAgICAgIDwvVGFibGVEYXRhU291cmNlPg0KICAgIDwvTXNTcWxEYXRhQ29ubmVjdGlvbj4NCiAgPC9EaWN0aW9uYXJ5Pg0KICA8UmVwb3J0UGFnZSBOYW1lPSJQYWdlMSIgTGFuZHNjYXBlPSJ0cnVlIiBQYXBlcldpZHRoPSIyOTciIFBhcGVySGVpZ2h0PSIyMTAiIFJhd1BhcGVyU2l6ZT0iOSIgV2F0ZXJtYXJrLkZvbnQ9IkFyaWFsLCA2MHB0Ij4NCiAgICA8UmVwb3J0VGl0bGVCYW5kIE5hbWU9IlJlcG9ydFRpdGxlMSIgV2lkdGg9IjEwNDcuMDYiIEhlaWdodD0iMTE4LjEzIj4NCiAgICAgIDxUZXh0T2JqZWN0IE5hbWU9IlRleHQyIiBMZWZ0PSIyNTQuMjEiIFRvcD0iMzUuNDQiIFdpZHRoPSI1MzguNjUiIEhlaWdodD0iNTYuNyIgVGV4dD0iUGFuYWRlcmlhIEludmVudG9yeSBTeXN0ZW0gUmVwb3J0IiBGb250PSJBcmlhbCwgMjJwdCwgc3R5bGU9Qm9sZCIvPg0KICAgICAgPFBpY3R1cmVPYmplY3QgTmFtZT0iUGljdHVyZTEiIExlZnQ9IjEzMi4zIiBUb3A9IjkuNDUiIFdpZHRoPSIxMjIuODUiIEhlaWdodD0iNjYuMTUiIEltYWdlRm9ybWF0PSJQbmciIEltYWdlPSJpVkJPUncwS0dnb0FBQUFOU1VoRVVnQUFBYVVBQUFEVUNBWUFBQUE4Mnp4K0FBQUFCR2RCVFVFQUFMR1BDL3hoQlFBQUFBbHdTRmx6QUFBdUl3QUFMaU1CZUtVL2RnQUFBQmwwUlZoMFUyOW1kSGRoY21VQVFXUnZZbVVnU1cxaFoyVlNaV0ZrZVhISlpUd0FBQ3gyU1VSQlZIaGU3WjFOc3ZUR2VhVzVBL1lPNkFVb1F0NEJQZkdFRVFyMlZDUDFUSXJRUUo1eHlPWUs1SWtHR3RFN1lFZDRBZW9kcUhkQTc0QWUycEx0ci9IZ3U2ZDh2cnlKbjhwTVZLR3F6aE54QXFqOFF3SUZ2QWVaUU4zNzJZY1FRZ2poSk1TVVFnZ2huSWFZVWdnaGhOTVFVd3FoZ1QvLytjOGZ2di8rKzdkUElZUlJ4SlJDYU9CWHYvclZoODgrKyt6RG4vNzBwN2VVRU1JSVlrb2hOUEQxMTEvSGxFSTRnSmhTQ0ExOCsrMjNNYVVRRGlDbUZFSURYMzc1NVd4S2VhNFV3bGhpU2lGY3lVOC8vZlRoNXovLytXeEtYM3p4eFZ0cUNHRUVNYVVRZHZMRER6OWNuaVc1TUtqZi9lNTM4eHQ1SVlRK1lrb2hiTUFVSFNPaTBveHFZbG92ejVsQ2FDZW1GTUlDakl6Mm1sRXBYaGxubWkrRWNCMHhwUkFxTUIxWE01dHJ4TFRlanovKytOWmlDR0VQTWFVUUNoZ2gxVXhHK3Z6enorZHBPb25QdFhLSVoxQWhoUDNFbEVJbzBGOXJXQkpUZW01S2VoT3ZKdkpEQ1B1SktZVlE4UHZmLzM0MkZJMklXR0pFakhvd0xOYjU4U3pyNUs4OWQ2SmNDR0UvTWFVUUNuaEJRVVlFR0kvTWhUZnJ5dEdQLzNVSERFMnZqVk0vTHp1RWNCMHhwUkFxeUdoZ3J5a0pYbTdnYy83YVF3alhFMU1Lb1FJam5GWlRvZ3lmODJQYUVLNG5waFRDQXBnUEJzT0xERHcvMHZRY24xbVg5R0lFNjVnWlN6N1hwdTVJeXdncWhHVmlTdUZsWVlTRHlkVEFQTlplWU5nam1aY2p3K0sxOHhEQ2UySks0U1ZodENMejhCRU42NWpWMm0rUEVLTW92UXpCNTdYeWxHRTB4Yk1tVGZWbHRCUkNuWmhTZUVuOEQ2dHFORk16bzYrKyttcGVmdmZkZDdNUlVZOGxhWlNsRGlNaS9WWkplY3IzOWhpVmFhcVBlaUdFOThTVXdrdmk1b0doQU91TWFpUU1CUlA1MmM5Kzl1R1h2L3psaDEvLyt0ZHpta1pKZXYzYjIzS3pJMTBqS1VSYktxdHRoaEErSmFZVVhoSTNFcVJuU0VxWCtmemlGNytZbDBxWHlmQ1pNcEtNRExNaGozVzFvVzJVeXQvRkMrRTlNYVh3c0xTK2NzMUxCaGhHelNpUURHYXR6QjVoVUd0dFlGZ2hoRStKS1lXSEFpUGlHWkQraWpmTGE5QVBXMTBhM2ZTYVVJdVk3dk1YTFJ6Mk5hT3A4R3JFbE1MRDRHL011VEFWWGh4Z0JMUVU0SVhlZm5QcFJZY3RVOEs0SkQxTGN0WHE3QkhieFZ6cGh3elgrOEtvVFgwTTRkbUpLWVdIZ0JGRGFSbzFJOWg2cTIzTmxEd05JOEFjTUxwclJ5dU1jS2pIdGpCTWI3ZEhlWTA4dkFJeHBmQVF1QUhwdGVwYXdOOHlKVTM3dVRBbGpJUjEybTU5VnJVRXByYjFmTW56MWtaZG1jNEx6MDVNS1p3ZVRJT0F2T2ZsZ3pWVFltcFA5VmxxSkVQN2lDbTVvMkJiUzJaRHVvd1dVZGJ6WFZ1bUc4S2pFMU1LcDhjRHR2OE95Q1d6d2JocU1QcnhrWlZHUTNxV3cyK08vRThPa2M5bjhqRU5TZlZMc1gyVm9iK1lCKzJLTlZPaUxuWG9PNS9YVElrMlFuaG1Za3JoOUd3OWx5R1l1MW54bWNBdTFhYnNCUG1ZQjB1TWdiSXloNXJvaTh4SHFwV1RNQngvS2FKV3BoUjlxYVVqK2hmQ014TlRDcWVuRnB4N0paWU1RR2JDYUFuVDJucXJUMUJXSmtkOWplQlFhVXE4dUZBendLVStZWWdZWndqUFRFd3BuQnJNb0F6TWVyUE4wNitWS052Qk9HaC9KSmlQcHZkOFc0SSt1SGt0N1J2MUtaZVhIY0l6RTFNS3A0WlJod2RtQmZlMUtiWTlFbTRBUjQ1Q2FIdkpsQUR6MVRUam1pbXg1QmhRaHVkZUhCK09CZXVZRmFPenZhTzZFTTVJVENtY0drWXRaWER1RWViQVVyZ0IrTytBQ093YWtaVXZPNnlKc3RTaHJwc0RhZVN6SFcyei9OMlJETmo3NUZMOW1xZ3JVOHNVWDNoa1lrcmh0T2ozUFFxOG1nWmpuZEdCRE1iemx3STNaVFh0eFdjWmhoc0E2NmoyWWdYYnE2VnZpVHFZaFkrVWZKdTBpNkhBbGltdHlVZU9iQ2VFUnlXbUZFNEpwdUdCbHNDTzZlZ3o0ck1iVTJsU1N2Tm5NTFJMdW94Z3J3RlFqanFhUGxRNmZlU3pwdFRXakt0bVNwNm45TDE5V2hKOUN1RlJpU21GVStJR1JNREhUTXFBVC9BbFhhTW5WMmxHckpPbXNudE1TU01PR1FaMXltMlNEaXlSaktlbTBwVDBxcmlYOGZ3ZXNhOGhQQ0l4cFhCS0NOZ0tzQVJwSHVSNzBKVnFVM2IrOWh6cnRjQmZNeVg5ZUZZakx1b0JTOHBSaDNRTVRxYkVDQTZvUzVseVc3UkZQUXhWZWRvbVMyRGZ0RTJrWjBOTG9qeGxhbWJzWXB2YXp4QWVoWmhTT0JXTVFnaldDcmdzU1N1bjdwVEh5RVZsRmV3eElreUNQSlZsblRiSTQzUE5sTW8wNmtCcFNnUjdpVzFqVXVUVkRKSjZhbVBKbElTbnEzNHB0dWU0bVMySjdjYWN3cU1RVXdxbm9EUWpGOEhmRFVaU2tGY2VSdVQ1aURJK2N0S0lhNDhwSVJrTmFUSWwra2lmVklaUkhYbElmWkxjMkpTbjlsazZuazc3N0krUEdCRnRPS3BUYnJjbXlyQS82aXRncUJ6N0VNNUNUQ25jbFRVeldwSkdUUXJFbXU2U2FTQkdFUDVNU1ZOazJvNkNzb0s2MGloWDlvWFBsRlA3R20waEdTSjVxR1lPbWtKVW5yWkpmeHkxU3o1bGhlcXhMZlZGKzZZOFdOcitrakE5eW1zS01vUXpFRk1LZDZIRmpKQ0N0ZFk5VDZiQkVnamNQbzNIdGpUZHBUSXlDS1h4V2FhZ2RJUmhxS3kyZzlTZVJpQTFVNkFNNmNyemJkSTNQbXNLVVBtVUZhcFh0azI3MmpkbnFSK29mRlpIZmQ5V0NQY21waFJ1U29zWkVUZ1ZzQlhFV1M4RHJ3ZDFCVjhaRWFiQ3RsdE5TWGxhVjdyU1dKSmUxbE5ia3RlaGp6NE42UG1zQzZXckRRelE2NkhhRkJ6OTBmNUtHbVVpalRCOVd5SGNtNWhTR0FxQmtHQkhvR05kdEpvUlN3WDhNbC9CV2xJWk55TEhBN242Sm9OUUdwOWxDa3IzUEswclhXa3NTUy9ycVMzNm96elZvVDhjbDNKRVJ6NTVtcUxUTWFNK0VteFArNlI5WnZxeHhQdFVtaFR5TmtPNE56R2xNQXpkZVVzRXdCWXpVa0JXOEMvcktxaDdzRVVxenpiOU9RNkJXczlydkN5b0xhWHhHZFhhVmh2YURsS1ExOHNPWlQyMTVXMzZOcW1uZmYzbW0yK3ErVnFuUG5Jb2k1bTU0ZklaazlQb2lUb3l2SnJLTmtPNEp6R2xNQVFQMUs2OVprVFExR2lDUUtzWEV6eGY2eklIeW5xZStrQ1FaeW1SN29GZWFlRHBLb2ZVdGtTUVI1N21vZzhZUTgxQXRVOXEwN2RKbXZxdC9WVSsrNG5ScTAzS0lrZkhER2pIanhuaU0zM1R0bXNxMnd6aG5zU1V3aEE4MEY0akFpNmlQa0hWNy9nbEFuT3RmUVZhREl5bGdudHBIcVNYb3pqU3luNHJxQlBFOTVycEhxbi82cTl2a3pSOUxrMkp6K0NteEpKanhENWl2cVFoaDNUYThIMVEzWnJLK2lIY2s1aFNHSUlIMnIxUzBDMERKc0dVUUY1T3VaVlNQUzFsU21WZlNDKzNVVE9sa1Via3d1Ujh0T0xiSkUyZlpaeWVYNWJWdWtTZmFidjJMQWw0c1lFeXRib1NlU0djaFpoUzZFTFBqQWlNdFlCWGluSWF5YkR1UnNBSWdBQkpPZ0Y2cTAwRldpMWxTbVVBaGpLdFprb3VmM3Z2RDMvNHc0ZmYvT1kzbC82UnAzd3R2ZjBsYzFNWjN5Wmw5YmxjbGlyM29SVDVHSGtKNld0MXlRdmhMTVNVUWhNdEx6QWdncWFtcVNUYXdJQTBkYWIwMmxTZVM0Rld5eDVUa3RGb2YrakxWMTk5TmEvLzhZOS8vUERiMy81MjdwdmFvU3lmcVUrYXQrOVRoZXlEOWtsbDNIeUF2ckR1NlN4TGxmdmdramtpdG9meCs0c09hM1hKQytFc3hKVENWZFNlVnl5Sk1vanlIcWdsZ3VmU2lJanQ2Rm5Sa2hSb3RWUXdMd013ZU5CR3BTbTVFVkQvdSsrK204MUkvUzlIU2ZTYk5QSkkxL0VnemMwVWM1TXhsZjFrNlhpNjZydksvWkpvbS8zaG1MRTk5WVdsK3FtNmJ2eEtZeG5DV1lncGhWMG80QkhFYWxJZ1JBUnRnaVFCa1hUUG80MWFPd1JLbm44b0lIdGdYNUlIVlphcXE4OFNsSUcrTkNYNlJEMVVqam9VeEQzWUs1OTE4cWxEbjFuU0JtbDhWaHBseTM2eWREeWRaYWx5djBxeFRiMEFRUnZxTjFKZDlydnNCNTlET0FzeHBiREtsaGxKQkY3S1VWNG8rQkc0bDBaS0dCSGxsc3hxVFdxL0ZtUlZCb0gvSlFOVW1oSnlzK2tWYmNtUXRGOWxQOTFFdkM5TWNWS1dwUXpONis4UjIyU2txZjFXWGRKbFZteVBkZkpDT0FzeHBmQU92ZlYyVFJEMDZTT0NuVVpKQkQwUHJPUlRsblhLS0dDM1NQM1RVa0ZkTDFJZytnQThYM0hUb1EvczU1WVJ5VmhvR3hIa3FZczBzdFArMGc4Ri9Kcktmcm8wcW1KZHBnUTZWa2oxcjVIcXF5N0hXL3Vzdm1wYklaeUJtRko0UjIxVXN5UUNHOEZaNWtLQUswY2xCRUVGWEwwZzRmblN0UWFsUUN2VFU3dEFZT2V6ajl4WVY1MGw4NkNmN0QvQnZBZnFZNDdhYjZSdDB5OVBMMFUreDR6ajRRYXIrdGZJYnpCb2s3Ykxkdmdjd2xtSUtZVlBVRUQwb0xVa0FxdU1oRG9FOHpMWUV2d0pqS1Z4MU9TamdqMVNjRlhnVnR0YnFINHB6SFFKcHNMb24wdHZ0MjJCR1hKYzFGLzZDZFJubXo2U1ZMNS9sa296OGZTeURVbHRlZDJ5SFQ2SGNCWmlTdUZDT2NKcDFkb1UxaEdtcEttNU5WT2lET2FvVWFBQ3VRZG82dE1IamJMSVg5c1hGOXVuTFVSZGpxWC9vRlY1bENXL2hneWRmTm9ydCsxOWRkRm5xSmtjYmJIMHVtVTdmQTdoTE1TVXdvV2x1KzA5a2lrUWlOZW00UlFrYTlwclNteUxwWUlyRU1EOXM1dFFiYXBNZ1h5dFB6SWFqZ3ZsQ1BoSzR6TnlJMkZiNVBuMktNL3g4UDVSbGpSRW01cGk5SHpXd1c4VWxGK0s3VEZhZEJPVVFlbVlldDJ5SFcwcmhETVFVd29YbG9MZWtnakNtcG9pa0dJQ01vd2xVYTZXam1ybUlYbTdiS2MwSWVVaGI0ZDFUSVcrc20wWmI4MlVLRU82QjNlSGRNcDVFRmZkV2gyTWdmYksvc3AwVkJlUmo1UlB2MEdtZ3FpRGtXMGRwOUxzU05mMldKYmI1bk1JWnlHbUZDNTRzR0xkQTZKRVFGUWdKNTg3ZEFJaGFSN2dsN1NuVEUzZUYvVlZ3Vmx0WWlvc01SN3lDYzYrVC9SVGRXZ1B2RCtrcVEwTVFtQXVNalBhVUo1TWl1MW9tNVFGRE1IYkpVOTlZWnRhWnlremt0UW50cVh0SXNyS09EVVNVam1WS2FYOXBTN2xRTnRXMjN3TzRTekVsTUlGQlNzRktqY0NSRkFqR0NJK2V6NkIxQVA4a3RZQ3FJdGc2Z0haMjE1cVEyVVU1Q2xIR3o2MXBUNnpCRytYTkQ4R1FEM2FRWm9PVkw2RUtZRkdSTlR4WThQMlpWcDhacHVzcTU3d2ZOVjFlZCtRR3c2d1RiVmRIaU9sMFg4ZEgvVlI5VU00QXpHbGNLRzhLL2ZBNm1rS2FoNDhGUXoxdVVjRVc3WlRNNEJTOUtYc0QvdFJtMDREN1JOTDhIMmdEcU1QMm1QYm9MWXhITXlZdmlIeTJWL3RNOXNrbnpiSUIwd0hrZTdIUit2a2FZb05QQi9SbHRLUXI1ZkNjTWlubnZhTitqcUd0YnBzWDNraG5JV1lVcmhBUUZQQUlzanBUbHdpZUhsdzgvS3Mxd0pmS2RvbEdCTEVDZmdFZTFRclc2b012QVI3a05Hb1B5eHJZQUJycGxTaTZUSEt5SkQ0ek5KTlQ4L1YzSXc4SDJoRHg4ZlhFY2VCYmFsOThwSHFxUngxS0VmZk5mcFNYazA2Vmxxblg5U3JsUXZoTE1TVXdnVVBnRFVSMUR5WWVubnV5REVOZlhZcFNMT3VRTWxTSnJOVWp6emFKUkQ3aUtKRXoyL1VINVlsbEtFZjE1Z1M1ZWtiaGxRekFPcktHRmxTbHI1aXNtVWYrS3hqcDNVTWd2Sks5M1pwaSszN2RpbW5mb1AyaFhMZWZrM2tZWDVlUnQ4WmFTR2NoWmhTdUVCZzgwQldTcU1iZmRhZC9aYTJBcVpFZ0ZUZ1hJTmdURjlvRjJtS1N2MVhHeTd2TjlwalN0U2hiUVgvbWpBRWdjRlFCOHA5OEdPZ2RjeEwrQWpHKytTaURzZWNmRkMvOUJrd1I5cWwzLzc5YU5zdStocFRDbWNqcGhRdUxBWER2ZEtkZlcxVXNTU0NKMEZSZ1pFK2FCcE1FSHdSUVgrdDdWci9DYnExS2F1YUtkRyswZ251cExHOVdrQ1hGTlNSK3FaOW9tMUV1c3FSVDVyV0tTdlVwdW94dXVTWUtsMTFWRWFtaERobXRJVWhhZlFHbEZOZDJ2STZFbmtobklXWVVyaWdBTFpYQkxQeWpueEpmbGRPNEZRQTEzWkpKMkFxblRRRmMyL0hnNjhDdHRmUkV0aG1iWG9NMVV5SmNoSjFTV043ZS9admo5UVA3YS9TWlV6NlREN2IxSE1wOGttbkR1dWtzeTZEcWZXUno1VFZzYUc4am91WFUxNElaeUdtRkM1NGdHNFZ3ZHlESWNGUno0TVVHREVVQlgwdFMyRTRDclFhZ2JGT1d3Umx6SVoyU05Qekt2V2ZwZEswTExYWGxQWkkrMFVkeEdmU3RZNldSa3FTbm91eHorb1RkUmoxNkxQcXNOK3N5NVI4Qk1TeEw5dEdwSG5meXJ3UXprSk1LVnp3QUgydDNIekFBNnNDWWxtSFBNb3BtTHRaYWZxTU5LYmZnRHhNUnFNbkJXSmdxVzFxR283MTJ0UWRxcGtTWWovb3J3eHhqK2pYVXJDWHZBemJMTXVydjZSN24raS81N0ZVZmFYVHR0WlpJbkJEVmwyV09zWVMreHJDV1lncGhRdGxnSzdKNytTNVE5ZWR2SThFOW9yZ3FjQkpYVGNROGdpZU1nY0ZYWTJZUEExWWF1UkV1dktXOW9sODhIeEg5Vmx1R1JSdEFPdVVWNXNPYVRvK3ZpNXBlNlI3bjFoWEg4cjZxb08wN25WcnBrUTdIQ2NnWC9WQ09BczVHOE1GRDJnU3h1QlRaUmhSclJ5bXhOUVJaVEVYaldacVVwcys3VVRRVk9CRUhuQ1J0bGtyQS82WnBkWnJmVVhrZytjNzNyWnZzeWJhQU5hcHB6WWQwdFNPcjB2YUh1bHV2SlFsai9TeXZ1b2dyV3Zibm9iSzdTRytCNldIY0JaeU5vWUxIdEJjYXdZalVSY1VRR3RsRUlHUWFUN3UyRmxYNEdRYnZoMFBxRWg5ODdaVkJ2d3pTNjB2N1JQNTRQbU90NzIyUDBqN3pqcjExS1pEbXRyeGRVbmJJOTN6TUhyeVBCM1RaMTExa05aOWZ6emYyMFFjZXovZUlaeUZuSTNod3RMemx6MGlHREw2cWVXUlRoQmtuWEthRG1QZFg0aFFlZVFCRlNuWWVuQ2xETzJDUG11cGRRL1NMdkxCOHgzVmh6S2dsNklOWUoxNmF0TWhUZTM0dXFUdGtlNTVySlBuNmZxc09rcGo2ZnZqK2Q0bUt2c1F3bG5JMlJndWVCQmphazNyTGt4QWdROGprWm1zbFhlejhxRHA2MlhROUw0Z2xmVnlsT0V6NkxPV1d2ZHR1REJnOEh4SDlhSHNXeW5hQU5hcHB6WWQwdFNPcjB2YUh1bWV4enJQZmp5ZHNxeXJqdEpZK3Y1NHZyZUp5ajZFY0JaeU5vWUx0U0JYaW1kTEd0MFEyQlFFeTZBblVkYmI4cURwNjJYOWN2dVVaYnJKeTFHR3o2RFBXbXJkdCtFaUhUemZVWDFZMmpkSmJiRk9QYlhwa0taMmZGM1M5a2ozUE5iQjB5bkx1dW9velc4WWtOOE1lSnVvN0VNSVp5Rm5ZN2pnUWM2bjhqeDRLZml4VG1CVEVDeURua1MrdCt0QjA5ZkwrbDRIVVpZeVpWLzREUHFzcGRaOUd5N1N3Zk1kMVllbGZaUFVGdXZVVTVzT2FXckgxeVZ0ajNUUFl4MDhuYktzcTQ2bitmNzR1dXA2bnFlRmNCWnlOb1lMSHVUOEliZ0hOeTlEdXZKa1ZLWElMK3ZVMXN1ZzZYV1FsNVVVaUVHZnRkUjZyWjdTd2ZNZDFZZXliNlhVRnV2VVU1c09hV3JIMXlWdGozVFBZeDM0UG5TTUtVdTY2bmlhNzQrdmU1dks4N1FRemtMT3huREJnNXpMZzV1WDRjMHd6NnVKZksvajVYMjlESnA2QlYycWJVZUJHUFJaUzYwdjlZOTA4SHhIOWFIc1d5bTF4VHIxMUtaRG10cnhkVW5iSTkzeldBZDlScFFsWFhVOHpmZkg4NzFOVlBZaGhMT1FzekZjOENEbThrQ0hXZWpsaGpJSTFsUUdUeS92NjdXZ3VmWVpLUkNEUG11cDlhWCtrUTZlNzZnK2xIMHJwYlpZcDU3YWRFaFRPNzR1YVh1a2V4N3JvTStJc3FTcmpxZjVDeWVlNzIyaXNnOGhuSVdjamVHQ0J6RUpBL0pBNThHTXBRTHdraWpqN1hwNTFqVWxWUXVhYTUrUkFqSG9zNVphWCtvZjZlRDVqdXBEMmJkU2FvdDE2cWxOaHpTMW8vV3lIa3ZTVlU0dmRxaU14Tys4U0ZjZDVPdTFOTFVwZVg5UUNHY2haMk80VUF0c0JDNFBYaDdNV1BKWmVUVlJ4dHYxOG1WZ2RKWHQxclpEdTlRSGZkWlM2MTZ2ZkU0R251K29QaXoxVVZKYnJGTlBiVHFrcVIydGwvVllrbzU0MFVUbFZFYWlMT24rWjRSVTMrVnBsUGM4N3c4SzRTemtiQXdYYW9HTndPWEJ5eitYcnlEWFJGbHYxOHVYZ1JGcFZGYTJXOXVPZ2pQb3M1WmE5M29FY1g5ekVEemZVWDBvKzFoS2JiRk9QYlhwa0taMnRGN1dZMGs2VWpzWXFjcEk1RkhHMDFYZnZ4T2wxZVQ5UVNHY2haeU40VUl0aURGOXAwQ09GRFQxV1FGd1NRUlZiOWZMMStvcVRVdU5idlFjQzZrL1BOL3k0S3p0c0VUVVZUdlVCL1dkZFBBK09Hb0xxS1B5S3V2eVBPcXBUWWMwMzNiWnByYW5mejFSdHNOU0lvOHlucTc2bnE2MG1qQi8vMTVET0FzNUc4T0Z0U0FtRWNoOEdzelhsNlRnNnVzRVJRVnBsL0sxckpYeEgrOHFDTk12OVo4bElrL3Q4Qmw4SkFiS1I0N2FBclVES3V2eVBPcXBUWWMwN1l2V3kzcWU1KzB3d3ZQalRCNG1xenBJdnl2emRHMXZqMEk0Q3prYnd3WDlvN25SOHI5NnJlQksycHFoS1NCN1hVVFFMWU03MEphQ01VdWt3Szh5b0haWittZmtxQzFRTzZDeUxzK2pudHAwU0N2NzdmVmtLc3FUU1BNUkRmSlJZNnM0WHJTdnRrTTRDemtid3llVXdldGVVckFzall2UG5rWmcxVDhFZEZNaXlKTW44eE15REJtQ1BpUG5HbE5TUHVzK0FpUk5JazNwYTZKTWFVTFhpdnJhbnJiUFZDZjdwSC9FcVArbEpOTVA0U3prYkF5ZlFKQWFFUmh2S1kwYzNLeEtVMk9mL0YrRkU2aEJueEVvV0d2a3dqcnRlM25VTWxvWk1jS1I0ZkE5eVhEb0k4S2NCZXVrWVVhVWtWa3VmYThobklXY2pXR1ZNcmdoQmVaYWNIc2tYV01TN0xmRE1hbVY2NUdPS3diQzlqREdtdUVJR1dqcjkwSlpqSnJ2Tm9TekVGTUszU2c0OGxlcENZNGFrWXdZR2JnVXJDWGQvYnRHYjFOaWU4NDFwa1NmNkp1UGJzcnB0QnE2SWRCeDFmNzZpSEJMR2xueG5jamsxcllad3IySktZV2JRREJFQkVZQzdJaHBRdXBMQkYwRmZCOWhJTisrUzMxeExSa2RlUTZCWFhYS2RqSHB2YWlPMnRMMmF2dTdKSm1lOStlYVBvUndKbUpLNFJSb1ZPQUJXc1oxemNoZ1N4bzVTTm9XMHVobFpGREh2R2hQbzUyV2ZWS2ZOVktrTGRxc1RlbUY4T2pFbE1MRG9BQmZlNzQxMHJocTBuYmNISkNQeXZqY01uVkozNm1qNlQyWlRxYlp3aXNTVXdwUHhUMk5hMG1sNmNqSU1zVVd3bnRpU3VIbFdKc3F2UFo1amt2bXcyaEpvNTBRd25YRWxFSllRRzhWK3FpcmxNd3RoRENHbUZJSUlZVFRFRk1LSVlSd0dtSktJWVFRVGtOTUtZUVF3bW1JS1lVUVFqZ05NYVVRUWdpbklhWVVRZ2poTk1TVUR1Sy9mdnp4dzMvKzhNT0h2Mzc3N1llL2ZQMzFoNzk4K2VXSGYvdjg4dy8vOXRsblZmMzdGMS9NWlJCMS91UDc3ei84MXcxLzhjOWZHZkEvanNxUFNQa0I2QmI4bGtkL01XSHJMeFRvVC9Ed1ozb2N0a1A2bnUwQnZ4dml4NjcwbDM2eXZ2ZTNRdXBEVGVTTmhuN3A5MHg3NGE5UzZJL0Y3ajBtanVwZSsvdXBubTJHTUlxWTBrQXdrYjlPZ1EyRHFSbFBreVlqdzlUK1l3b1lHTjBSRUx6OEx4TzR0Z0sxMTkwS2dnUitsZlhBUnlBa2plVVdCRTYxVVdwUE1QVStsQ0p2SkppTC9rTEVubjBEam5mWnI5TEUxL0RqczNlYjROL2oxbkhncHFsNnJtNklHNjRTYnI1bzcxclZyZ1hTYW1YM0tKeUhtRkl2UC8wMFgxaERqV2hGWE5oc2J5U01OQWhHTEFta3lJUDNHcTJteENoSGYrVjZyeW5STDlYblQvcFFIaVBTQ0krMExkUUhBajM5ZFkzOFczUytyMmlQUVhBOHZMeU9DL3UxNXkrQ1U0YXkxMndUcU9lajVGdWFFbW0xc2x2Nno4cTVSbHF0N0I2Rjg1QnZvd05HTDJ0VGNrY0tFeHhsVGdwa1Bpb2lRQ3N3cmtFd1Z6QmpmWTJsUUszZ3U3VXRIMFY0a0hhejJ0dUhyVzMxd25hUWp1MmU3Zm14RlBxOHRWK0EwVkwyMm4zVThaY3hVWCtObUZJNGtud2JEWER5MzJwa3RDWDZVYnRBcjBGQkNSRkVHVEV4RGJUbjdyekZsTFJrV3hpS3RyOFZSTDErSzJxREFNeTZhK1JJU1doN2V3MUMwMzNVMHpyTExmUTk4TjN0UFo0Z1EyZDdxc2Y2R2pHbGNDVDVOcTZFWjBhMWsvcmVvbCt0bE5NM3JxM0ExbUpLdEtrcFEvMXZvajNiVXYydG9MbUcycWhwcS84dCtEN3ZRYU1kMTU1blNoalh0U1lQNnA5R3hxeHZIZCtZVWppU2ZCdDdtUUwzdjA4WGZ1MkVQb3ZvSC8xc2hjREVDSWtncUdrbmxtc2pwbFpUOGlrM0dkUldFRlg5cmFDNWh0cGdIK212YTgvSThGcDhuN2ZnclVMS0lyNEhmMm1CdkNWVWp1UElmc2pZV0s2Ti9zaWpISDMwZWhqY1dyMllVamlTZkJzNzRLMjZzeHZTUlpPSlhQTXFPZVpBVUVJZWlBalFCQ2kwOWxZYndVemxXRitqRE5DNk01ZTJBcmVlS1pWRzJkT0hvN2xtZXpvZVBsMm5LYnkxK3FwWEU5dGZ3bzlicWJWNk1hVndKUGsyTmlEQTMrdGxobVpkYVV3S1JBUkFEQWlqV25xcG9LVEhFR2pYcHcyM0FyZnU3QkgxR0NGUVIyMWdWbHVvRHl5cFcybzA1VDZ2d2JIWC92RWQrUDZ1alpRNDdyNFB2bzlyTnhTYTZpdnJjVHpYNnNXVXdwSGsyMWlCM3owOG5DRkpHTlBVL3owUWtCVDhTakdsczBhUEtZRUhZazlmb3ZZN0hta3RjQXYxWVVtanFlM3pHcG8yZFdFUzE2RHZjKzgyaGVyUjV6VmlTdUZJOG0wc01kM0ZQOHlVM1lLdWVjYmtmeVZCZ1lrZ3RmV2NoYnQ1eXFLMTV4Q0FvVkN1dkF2SCtHcnBTOUJYeWhQQWtaNmw3RUY5V05Kb2x2WjVDWTRoKzhOKzhWMnd2blZjUzlqV05kc1Vxa2VmMTRncGhTUEp0N0ZBNjhWeU52MTFZNlFUd3JYRWxNS1I1TnVvMEhyUm5WVzFDemlFVm1KSzRVanliUlRNTHpaVVR0cGVNWlhHYjRuNEk2MWNQSHJldy9iNGZQbmpyUWVNMFBpQjdkNXB2QkMyaUNtRkk4bTNVVEQ2T1JMVFozdGZPTGd3R1FoL3dtamtYNDBna0lSd05tSktvU1RmaHNIZmtxdWRzQzNDM0s1NUxidktaRTdEcGhJLy96eWpwWEE2WWtxaEpOK0dNV3BrTXZybGd2bGltMHlsdHExcmxORlNPQnN4cFZDU2IrT05VYU9rbzk1MkcvSWozb3lXVGd2ZkwxTzJQSGNrVUMrSkd3dWVQejdMOThnK1ZjL1ZEY1dVbnBkOEcyK01HQ1VkL2ZyMS9LOHlLdHU5UnFQL0YxTm9CeVBpbkdtOTJhQnVMVGdMOGpDeGEzWDFNOUFPbnRLVXBoc0crckttN3FuOUp5YW1OTUdkWisxRXZVYnpEMVZ2UU90RkxQRmZiRWZBaGVWMzlwc3ZpRXlCbDNKc244REhNYjlsOEJ2QmJDSlQzK2Y5cmR6RWNFejJRTG5lNzlGRlc3VmpTVjlyNWJlMGR6OUcwSG9jYW4wa3JWWjJqM3FZMzV4OXV3NXFiYS9xN2JyUU5aR1pqSmpTRElHeWVzSmNvVnZkK2ZSY2VGTHJpYzhvYThTeGNoSGM1enQrTHNnQnRBUUc2cXpCZnU4WlNXOEc4K200ano1K0YwM0JyUndGSDJWS3JlM1dqbk5USUo5MGIxUHFIZVd1aVhQa2xXYzBZa3BUb0tpZEdOZm82R203a3RZTFdicktBS2JqTXdlaEF5NitkNXEyd1Ixbnp3aHFwQ2tSZUs3NWljQmFNSi9iR3ZRaXpabzhtTVdVOW1zdm5KdTkxOTl1Y1QxTXgvclZSazh2YjBwY3hOVVQ0Z3JkZWhvS1U2bjFZNi9tRTMwSDgzWnVZVVlWWWZRdHgzV1VLYlhzKzFJd3g1QnVlUnhsVERHbC9kcEQ2MzczaXB1WlVUTUpqOERMbTlJOEJLK2NDSHQxNjFHUzZBbHlUQStzd3Vpbzg3Z00wYlNQMTA1ampEQ2wyVVFxNWJaVUM1UzNOaVNKN2NhVTltdVZJNmRkcjlBY2ExNWcxUFR5cHRRYk1MWXU0S1BvTVkxYWNMZ3duZlNqLzZwRnI2NHhwbDVUNmpHUmQrZkNkQ3p2WVVob2ZsYjN1N1ovM1I5VE1rNTJQY3d2VkQyNU1iMjBLYlhlRVV0YytQZENkOEl0V2d2eVo3Z2pyR212TVhXWlVtY0FLZ05sYThBZHBsSG1Xc0E1Vkt1M3BVYzBwYlBkb0tITm1ZNEg1NlZOaVVCWCs5TDNpanZSWjZJMTJOeEVVNERkODR5cHg1UmFSeGFTQjhvUnZ5bTdsMkpLSHpuRkZQYUNPTCtlbFpjMnBlNGc5RVFQSDN0SGpiZlFudWQzcmFiVUU5QWtCVXJNODE3VGRpTVVVNXJhNm55WjZIRHR2RWw3UkY3YWxGb3ZDT21aNW5aN2o4V3R0SFVodHV3SGRVYThycTFBZWVZNzdEMTZlVk82NDdQQWE3VG5KdTBSZVdsVDZqbng3dms4YVRROUYvT3R0VFZ0Y1U5ejVUak9vNlJLWG92bWx4VW1BNWpiblVheU0xUEE1RFBINGFqbmY3Uy94ck9iVXV2K2xXTGZFRE15dE1uM05lL3ZRTU43eHBjZVh0dVVLbC95WGozVHc4WWhkL2JUaGNZeDRlSjdwK21pYkEwK3BXaG5qVkhiYVJGQmNjU3h4SXkyakVGZ2dxUE42ZFZOcWNjMDJKODkwL3A4Yi9OeDdEU29aM3kyOUxLbTFIdEh5d24xTE5UMmI2OElvTHRmMlo3dTZpamJPMVcyeGwxTjZaLy91VHZJekZNeURYZS92Uy90dUY3WmxIcWVKZTIrRGd6aVVNOGJmclZqK3VpOHJDbjFuTURvV2U1UWVpN0M1dDlNVEhWNkxzVExWRmFGZTVyU1g3LzVwcHErVjcyajcxSEc5TXFtMVByeUUvV2E0WHJvdUZGN05tSktqZHE2Y0IrRjFnRERpS0RKa043b09mNXJ4LzR3VTJKNmNtcWI0N1drdi96OTM5ZnI3bEhuOFJUMG85citGZG82dDF1MzhRaW0xTm9mUmp3OUhIVTlQQ0l2YTBxOWQ1WFBjaUswWG9RRXBsNWE3dzdYam4zci9peUo2YlM5ci83WDZ1OVZ5OVRQRXIwLytOdzZ0NS9abEdwNWV6U0MxdXZoMlo0cnZhd3A5ZDVSUG9zcHRWNEl2WGVHTURJZ2lWR21SR0JmbXlZczZRbUlmQWNqNmYyTnpkYTVIVk42cjcwM0xtdTB2aVF6NGdieFRNU1VHdlVzMVBadFMvT3pwQUdjMVpSYW5wWDFuRTlIQkpXZVp4UXhwZXZWY3M2VU1Gcm1lRnlycnVkWkp5U20xS2hub1hhU2IybklkTUYwQWJlK3FYYWtLYzJqbG9iZzB2TmE5alVqc3IyMFByQkhNYVUyWVV4Ynh5NXNFMU5xVk9pajUvYzhSNXBTYTFCcDNpNHZPQnhBenhUZTFqR0lLYTJMR3h0dUNrWk02YjBpTWFWR2hUWVlGUnhwSEQxdDE0TG1YbXJ0N1ZIUE50Zm8rUjNlSzV0U3o3VG5rdGhIanRuV2NRMGZpU2sxYXNUcnU2OEF3WkU3UnU0Y21kNm9IY3RyZFpRcDlid0JWMnR2ajQ1OEhsRGIzaDY5c2ltTi91c1lOWDFpVW9rajczaFpVOG9yNFlPWUxpcU9CY2VUQzQxcE9TNjZJKzQ0cGJWajMyTkt6VzhVOG55czB0NGVjY3lPb3ZVbVlPdmNmbVpUNG5scExmOUk4VDF4M1hBTmpYaXI5ZEY1V1ZQcU9ZSFIxb1g3bEdCQWpIcW1vRFFIazhZWEZYcTFkdXliVGFuajJVN1B1WFNrS1kwTStNNHptMUxQdE9jb1lWS1k0NnNhVkV5cFVWc1g3clBBaGNFRk1tcnFiWVRXam4xcmtLc0Z6TDMwbkV0SFBneVBLZTJYMC9NU3ptaHhmRjd0aFltWE5TVWV1TmRPZ3IwNjhnNzNESENCdHdhTW83VVdORnY3VENCcXBTY1lydTFMTHlNRHZ2UHNwalJQeDk1cEZtQkpUSWNmZWE2Y2laYzFKYWg5K1h2MWJEOVlFNHlNem1wRzB0ckYyV3hLSFRjWlBjSHd5SnVibU5KK2xmUzBkYVRtUDlyNzVDOUh2TFlwZGR3TjFTNndSNGRwZ3JQZElkYTBGalR2WVVvOW8rNGpUYW4xWlpPWTBrZm05azU0UGZDOUh2R0Q2N1B3MHFiVWVrRkl6MFR2MjRpMzFObE1DV3B0N2xGZUNUK3ZLUUhCLzB6UFV5K2F6UEpaamVtbFRZbUFVUDNDZCtwWlRvcDVoRlRadjZQRW5SNG1PRElnaVVjenBWcWdIa0hQVzJReHBmZk1yNHFmYmRUMHBNYjAwcWJVT3pvWThqZmdHdWt4Vkgrb1B3ZXZXMXhzMHphWUQrZVlpMmN5cFo3ZlpSMUJ6NDFHVEdtQm4zNzYrQ1pxeDNjOVdvemlubzJYTmlYdU1tcGY5RjdkODRUb3VUQThBTGNHaFRYUk53eUk3UkFjbDM1djhVeW0xSE1jajNqbHQrZTE1cGpTTm14clBzWW5HRDMxbnJ0bjQ2Vk5DWHBQcXFXQWV5UzlacW9MdXVjaWRtRkNqTnptZHE5NE0raVpUS2sxVUtQNWphckI5SnpYYThjWFlrcWZ3blk1Sm5kNzlqUjkxOC9FeTV0Uzc5KzY2dmw5U3l1OXo4SkV6OTAwSXFCc0JiQTFuc21VZXAvTGpieTU2WjJXM3ZwT1kwcnIwQStPVWV1K3RjaW54UitkbHplbDNndDR2a3U1OGU4R2V1NkNQVERVOHZkcXhQTzBrUUZKdExiWmEwcnpEeTRyN2U3VnNKdWJxUis5enp4aVNtTzVoVW5kNCtiNEtGN2VsSHFEQ2JybENUSHE1WXllQzdnN2dML3hWS1kwMFR0OXM3WmZlK2tkL2FLdGZzU1VPcGppRGFQcStYdnFmSFRnNGtia1dZZ3BUZlJPNGFFUkFXV1RBWGZCbWlacURTd2pSNGF0RitYYXNiNm5LYzJ2RFZmYTNxM3BlUFM4NGp2Q2tGQk02WGJ3Zlk4eXFHY2hwalRSK3p4ZzFzQmd2VVN6a2J6SjN4WnNOZUpSUC9hY1gwV3Z0TDlIWnpXbG5uMjZhRHFQdGt6aEhkTjVOK0xHU25wRlUrSzhwaS9YYXNSNU16UGdPM3dXWWtwdjlJNUEwQnowRHpLbUVjWTU0amRDb3g2bzlreERudFdVWU5Sb2hYWTJSMDNUdVRZYnhJQzdiTmNybWxKclAycjcxRVBQRlBDekVGTjZvM3ZxNVUxSEdOUDhDbmh2NEdFa1o0d01CaTMwM0JXZTJaU0dqSlpNOCt2MmswSFJQMWZyZnU3Uks1cFN6eHV0SSttNVdYc1dZa3BpTXBKUmQ1d0VrbEhCZXo1SkIvU0xRT0swQm9NUkk2WGV3SDFtVTRKUm82Vjc2U1ZOcVhHZjBNZ2ZQL2ZzdzdNUVV6SjY3bEpxbXArL05JNmFDTnpEbmhNd1NpcjYwUnk4Qnp4VGF0MjJkSFpUR25tRGN3KzlvaW4xVEkvWDlxdVY1bjRVTXlHUFRFeXBvUGUxM25lYVRoYnVuTGN1ZE1GSk9mcE91emE2YVEwR3ZhK2VqdGkzMDV2U3hJaG5nUGZTSzVyU2ZDTlJTZCtyRVRNSTBIbzhhc2YyVVlrcEZmVCtDWjh0Y2ZLVXp3Z1lFUTAzd3pjdG5hdzk1dEQwdzlucG9oODE4bnNFVTRLZTV4UkQxRGhhZTBsVG11aTlCdWR6cUhGbUJHNStUWjZVbUZLRjFvdnVkSnFDRXRPQU5YcjNjZmVkNFhTUnp0c2FPSjMxS0tZRW8wZTllNlZYbkd0NVczcFZVeHJ5c2hNekk5T3gzenFHZ3V1VDdZNzYvZUV6RUZOYW9QVmlPWlBXaktQbkFwWTRSdk5EM3VMdWNMN1FwbTNQQVhtZ0dVbHIrOVg2dlIxbFNuQnJZNXJmQUowWUdmQ2RaeldsZVFwdjhQbktkOEUrSXN4S053dnpmZy9hRm0wOUV6R2xKYVlUZE1SdmwrNGxUdjR0ampDTVcyak5RT2FMdlZKblMwZWFFclFHOG1zMUc5TGJUVUxyc1hoWlU1cTQxZmMwVWx2ZjE2TVJVMXBoeU8rRDdpRHV6UGVBY2RYcW4xMlBhRXBBOERqeVJzY05DV0pLKytYMFBsdTZwWGhPKzJ6RWxEWjROR1BhYTBqQU5GdXRqYlByVVUxcFpqS05PYWlQUEtlbXRtcjlqeW50bC9NdzEvelVSNzhKZVJaaVNqdmdKSDJFdTZkckRFbTBCcGh1VFJkVTY0UGxXbkFUcHpjbE1RV1QrUUYzeDNuRnFHdnU5MEpnYW0zNzFVMEplRzVaSzNjYVRkY1BjZWtaaVNudFpicndXeStnVzJqUE02UWxibTI0YkU4WFZDMS9qNWJlTm5vWVV6SXVMNFpNZmFELzFYMllndENjOS9YSGZ6Ty9KeUM5YTJPbllrb2ZPYTB4UGJFaFFVenBTdWE3Kytta3FKNHM5OURVbC9rTnVCNG13NzJWTWMyQnllN3NtNC9sd29YWkd1VHVhVXBIVWR2UFBZb3AvVGV6TVozc2VuOW1RNEtZVWdQYzJiWmVUQ00xUCtSY21McTVtaHNZVXkzdzkvNmd0cnhBWTBvZk9TSkFpMWN5SlRqTjljN3hHM1c5bjVpWVVnZGNCUGM0V2RsbTdhSWN3UkZ2NU5IZnBidTczaW1TOGppMGZoL1Baa285eDNXTFZ6TWx3VEc5eDg5RXVGazg2bm8vSXpHbEFSQndqL3FocUl0dDNPTGtaSDlHL0VtZ1hlWTUzZmxScmxXbDJmbVBFNjhSQWVlWm1NL0h5bmV5SlFMZ0ZoeXIyakhjVXUyNVordjNWYnZKbWMvYlN0azl1b2JMMzZjODhucWYycjdWOVg0MllrcURtVS9ZNlVJYk1SVTJ2MTAxblpoendMekRzSDErQUgvbEcyS1VaZjlyUVNQY2p0YUErWXkvZXprU1RJT1JJOGJXWTFKYzY3UkJXNjlvUkU1TTZXQTR3VEFWVHJiVnU4SzN0NnAwVWk2OVhYWlA2SmN1UWduVFV2cXJVLzFlZDJya1NJMjJhb0Z2ai9oT1F4KzZIaERYaDE4djVUV1RtN2YzeEpSQ0dBVG1VZ3YwZThTZDhoQ21FWFhQSFR1Qk1vUjdFbE1LWVJDdHozRWs3cUM3NkgyRGNqS3pFTzVOVENtRVFmUk1tODJhVEtGMUdvOFJUdStiWVpocUNQY21waFRDS0pnNnF3VDdhM1Y1eHJUMWNzdVVUN21lYVVOWHB1N0NHWWdwaFRDUTNpbThkNXBHVDNvWnd0WHozS2dtMmd6aERNU1VRaGdJYjAzV2d2N1psVkZTT0FzeHBSQUd3NnYvdGNCL1Z0SGZFTTVDVENtRTBmUytCWGREWmRvdW5JMllVZ2hIOEFER1JQODJYNllJNGNiRWxFSTRpaE1iVTE3L0RtY2xwaFRDd2ZDblpXckdjQmQ5UHVEL2I0VndJREdsRUc0QWIrVU5mMTM4R2sxbWhEbG11aTZjblpoU0NEZGtOaWZlemh2OE82TWxNWDA0Ly9taW1GRjRFR0pLSWR3SmZodWt2eHhmTTVRV3pmOEM0ZXV2WnlNNjQxK2FEMkdMbUZJSUo0Ri9ZekQvUDY2M2YzR0F1ZWd2T05Ta2N2eXBvZm5IcnhrTmhTY0FVL3EvSDFkRENDR0UrNElwL2VQSDFSQkNDT0crWUVyLzgrTnFDQ0dFY0ZmK0ZWTkMvenAvRENHRUVPN0hQOG1VL21uK0dFSUlJZHlQdjVVcC9jMzhNWVFRUXJnUHZIVDNtVXdKNVlXSEVFSUk5K0p2SjMxaVN2OWowcjlNQ2lHRUVHNEpnNkxaaTl5VUVFNFZRZ2doM0lyL04rbmlRMjVJMHYrYUZFSUlJUndOYjM0elMzZnhJRGNqVjR3cGhCRENrV0JJODNNazF5Y2ZDc1dZUWdnaEhBRlRkcnoxL2M1NzNpVVV3c1h5OGtNSUlZUlI4THZZVDZic1hOWEVRbFQrMzVQeVZ4OUNDQ0cwd2dEbjd5YlZmT2FpYXVLQ1pFNFpPWVVRUXRnTFA0cmxjVkROVjk2cG1yaER1QjBHeGNZeWdnb2hoQ0FZdVB5ZlNmOHdxZnJjYUZrZlB2di84NE5PY01rbzVpNEFBQUFBU1VWT1JLNUNZSUk9Ii8+DQogICAgICA8VGV4dE9iamVjdCBOYW1lPSJUZXh0MyIgTGVmdD0iNDI0LjMxIiBUb3A9IjgwLjMzIiBXaWR0aD0iMTk4LjQ1IiBIZWlnaHQ9IjI4LjM1IiBUZXh0PSJTYWxlcyBSZXBvcnQiIEF1dG9XaWR0aD0idHJ1ZSIgRm9udD0iQXJpYWwsIDE2cHQsIHN0eWxlPUJvbGQiLz4NCiAgICA8L1JlcG9ydFRpdGxlQmFuZD4NCiAgICA8Q29sdW1uSGVhZGVyQmFuZCBOYW1lPSJDb2x1bW5IZWFkZXIxIiBUb3A9IjEyMC4xMyIgV2lkdGg9IjEwNDcuMDYiIEhlaWdodD0iMTcuMDEiPg0KICAgICAgPFRhYmxlT2JqZWN0IE5hbWU9IlRhYmxlMiIgTGVmdD0iMjguMzUiIFdpZHRoPSI5NzMuMzUiIEhlaWdodD0iMTcuMDEiIEJvcmRlci5MaW5lcz0iQWxsIj4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjE2IiBXaWR0aD0iNDcuMjUiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjE3IiBXaWR0aD0iNDcuMjUiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjE4IiBXaWR0aD0iNTYuNyIvPg0KICAgICAgICA8VGFibGVDb2x1bW4gTmFtZT0iQ29sdW1uMTkiIFdpZHRoPSI0Ny4yNSIvPg0KICAgICAgICA8VGFibGVDb2x1bW4gTmFtZT0iQ29sdW1uMjAiIFdpZHRoPSI1Ni43Ii8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW4yMSIgV2lkdGg9Ijc1LjYiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjIyIi8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW4yMyIvPg0KICAgICAgICA8VGFibGVDb2x1bW4gTmFtZT0iQ29sdW1uMjQiIFdpZHRoPSI4NS4wNSIvPg0KICAgICAgICA8VGFibGVDb2x1bW4gTmFtZT0iQ29sdW1uMjUiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjI2Ii8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW4yOSIvPg0KICAgICAgICA8VGFibGVDb2x1bW4gTmFtZT0iQ29sdW1uMzAiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjI4IiBXaWR0aD0iOTQuNSIvPg0KICAgICAgICA8VGFibGVDb2x1bW4gTmFtZT0iQ29sdW1uMjciLz4NCiAgICAgICAgPFRhYmxlUm93IE5hbWU9IlJvdzIiIEhlaWdodD0iMTcuMDEiPg0KICAgICAgICAgIDxUYWJsZUNlbGwgTmFtZT0iQ2VsbDE1NiIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IlR4bi5JRCIgRm9udD0iQXJpYWwsIDhwdCIvPg0KICAgICAgICAgIDxUYWJsZUNlbGwgTmFtZT0iQ2VsbDE1NyIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IkNvbXBhbnkgSUQiIEZvbnQ9IkFyaWFsLCA4cHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGwxNTgiIEJvcmRlci5MaW5lcz0iQWxsIiBUZXh0PSJCcmFuY2ggSUQiIEZvbnQ9IkFyaWFsLCA4cHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGwxNTkiIEJvcmRlci5MaW5lcz0iQWxsIiBUZXh0PSJUeG4gVHlwZSIgRm9udD0iQXJpYWwsIDhwdCIvPg0KICAgICAgICAgIDxUYWJsZUNlbGwgTmFtZT0iQ2VsbDE2MCIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IlR4biBOdW1iZXIiIEZvbnQ9IkFyaWFsLCA4cHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGwxNjEiIEJvcmRlci5MaW5lcz0iQWxsIiBGb250PSJBcmlhbCwgOHB0Ii8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsMTYyIiBCb3JkZXIuTGluZXM9IkFsbCIgRm9udD0iQXJpYWwsIDhwdCIvPg0KICAgICAgICAgIDxUYWJsZUNlbGwgTmFtZT0iQ2VsbDE2MyIgQm9yZGVyLkxpbmVzPSJBbGwiIEZvbnQ9IkFyaWFsLCA4cHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGwxNjQiIEJvcmRlci5MaW5lcz0iQWxsIiBGb250PSJBcmlhbCwgOHB0Ii8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsMTY1IiBCb3JkZXIuTGluZXM9IkFsbCIgRm9udD0iQXJpYWwsIDhwdCIvPg0KICAgICAgICAgIDxUYWJsZUNlbGwgTmFtZT0iQ2VsbDE2NiIgQm9yZGVyLkxpbmVzPSJBbGwiIEZvbnQ9IkFyaWFsLCAxMHB0Ii8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsMTY5IiBCb3JkZXIuTGluZXM9IkFsbCIgRm9udD0iQXJpYWwsIDEwcHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGwxNzAiIEJvcmRlci5MaW5lcz0iQWxsIiBGb250PSJBcmlhbCwgMTBwdCIvPg0KICAgICAgICAgIDxUYWJsZUNlbGwgTmFtZT0iQ2VsbDE2OCIgQm9yZGVyLkxpbmVzPSJBbGwiIEZvbnQ9IkFyaWFsLCAxMHB0Ii8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsMTY3IiBCb3JkZXIuTGluZXM9IkFsbCIgRm9udD0iQXJpYWwsIDEwcHQiLz4NCiAgICAgICAgPC9UYWJsZVJvdz4NCiAgICAgIDwvVGFibGVPYmplY3Q+DQogICAgPC9Db2x1bW5IZWFkZXJCYW5kPg0KICAgIDxEYXRhQmFuZCBOYW1lPSJEYXRhMSIgVG9wPSIxMzkuMTQiIFdpZHRoPSIxMDQ3LjA2IiBIZWlnaHQ9IjMyLjEzIiBEYXRhU291cmNlPSJUWF9JbnZlbnRvcnkiPg0KICAgICAgPFRhYmxlT2JqZWN0IE5hbWU9IlRhYmxlMSIgTGVmdD0iMjguMzUiIFdpZHRoPSI5NzMuMzUiIEhlaWdodD0iMzIuMTMiPg0KICAgICAgICA8VGFibGVDb2x1bW4gTmFtZT0iQ29sdW1uMSIgV2lkdGg9IjQzLjQ3Ii8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW4yIiBXaWR0aD0iNTIuOTIiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjMiIFdpZHRoPSI1Mi45MiIvPg0KICAgICAgICA8VGFibGVDb2x1bW4gTmFtZT0iQ29sdW1uNCIgV2lkdGg9IjUyLjkyIi8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW41IiBXaWR0aD0iNTIuOTIiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjYiIFdpZHRoPSI3NS42Ii8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW43Ii8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW44Ii8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW45IiBXaWR0aD0iODUuMDUiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjEwIi8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW4xMSIvPg0KICAgICAgICA8VGFibGVDb2x1bW4gTmFtZT0iQ29sdW1uMTIiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjEzIi8+DQogICAgICAgIDxUYWJsZUNvbHVtbiBOYW1lPSJDb2x1bW4xNCIgV2lkdGg9Ijk0LjUiLz4NCiAgICAgICAgPFRhYmxlQ29sdW1uIE5hbWU9IkNvbHVtbjE1Ii8+DQogICAgICAgIDxUYWJsZVJvdyBOYW1lPSJSb3cxIiBNYXhIZWlnaHQ9IjE4OSIgSGVpZ2h0PSIzMi4xMyI+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsMSIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IltUWF9JbnZlbnRvcnkuVHhuX0lkXSIgRm9udD0iQXJpYWwsIDlwdCIgVGFiV2lkdGg9IjEwIi8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsMiIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IltUWF9JbnZlbnRvcnkuQ29tcGFueV9JRF0iIEZvbnQ9IkFyaWFsLCA5cHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGwzIiBCb3JkZXIuTGluZXM9IkFsbCIgVGV4dD0iW1RYX0ludmVudG9yeS5CcmFuY2hfSWRdIiBGb250PSJBcmlhbCwgOXB0Ii8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsNCIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IltUWF9JbnZlbnRvcnkuVHhuX1R5cGVdIiBGb250PSJBcmlhbCwgOXB0Ii8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsNSIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IltUWF9JbnZlbnRvcnkuVHhuX051bWJlcl0iIEZvbnQ9IkFyaWFsLCA5cHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGwyNiIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IltUWF9JbnZlbnRvcnkuVHhuX0RhdGVdIiBGb250PSJBcmlhbCwgOXB0Ii8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsMzEiIEJvcmRlci5MaW5lcz0iQWxsIiBUZXh0PSJbVFhfSW52ZW50b3J5Lkl0ZW1fTm9dIiBGb250PSJBcmlhbCwgOXB0Ii8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsMzYiIEJvcmRlci5MaW5lcz0iQWxsIiBUZXh0PSJbVFhfSW52ZW50b3J5LkJhdGNoX05vXSIgRm9udD0iQXJpYWwsIDlwdCIvPg0KICAgICAgICAgIDxUYWJsZUNlbGwgTmFtZT0iQ2VsbDQxIiBCb3JkZXIuTGluZXM9IkFsbCIgVGV4dD0iW1RYX0ludmVudG9yeS5FeHBfRGF0ZV0iIEZvbnQ9IkFyaWFsLCA5cHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGw0NiIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IltUWF9JbnZlbnRvcnkuVHhuX1ByaWNlXSIgRm9udD0iQXJpYWwsIDlwdCIvPg0KICAgICAgICAgIDxUYWJsZUNlbGwgTmFtZT0iQ2VsbDUxIiBCb3JkZXIuTGluZXM9IkFsbCIgVGV4dD0iW1RYX0ludmVudG9yeS5UeG5fUXR5X0luXSIgRm9udD0iQXJpYWwsIDEwcHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGw1NiIgQm9yZGVyLkxpbmVzPSJBbGwiIFRleHQ9IltUWF9JbnZlbnRvcnkuVHhuX1F0eV9PdXRdIiBGb250PSJBcmlhbCwgMTBwdCIvPg0KICAgICAgICAgIDxUYWJsZUNlbGwgTmFtZT0iQ2VsbDYxIiBCb3JkZXIuTGluZXM9IkFsbCIgVGV4dD0iW1RYX0ludmVudG9yeS5TVXNlcl0iIEZvbnQ9IkFyaWFsLCAxMHB0Ii8+DQogICAgICAgICAgPFRhYmxlQ2VsbCBOYW1lPSJDZWxsNjYiIEJvcmRlci5MaW5lcz0iQWxsIiBUZXh0PSJbVFhfSW52ZW50b3J5LlNEYXRlXSIgRm9udD0iQXJpYWwsIDEwcHQiLz4NCiAgICAgICAgICA8VGFibGVDZWxsIE5hbWU9IkNlbGwxNTUiIEJvcmRlci5MaW5lcz0iQWxsIiBUZXh0PSJbVFhfSW52ZW50b3J5LlNUaW1lXSIgRm9udD0iQXJpYWwsIDEwcHQiLz4NCiAgICAgICAgPC9UYWJsZVJvdz4NCiAgICAgIDwvVGFibGVPYmplY3Q+DQogICAgPC9EYXRhQmFuZD4NCiAgICA8UGFnZUZvb3RlckJhbmQgTmFtZT0iUGFnZUZvb3RlcjEiIFRvcD0iMTczLjI3IiBXaWR0aD0iMTA0Ny4wNiIgSGVpZ2h0PSIyOC4zNSI+DQogICAgICA8VGV4dE9iamVjdCBOYW1lPSJUZXh0MSIgTGVmdD0iMzk1Ljk2IiBUb3A9IjkuNDUiIFdpZHRoPSIyNjQuNiIgSGVpZ2h0PSIxOC45IiBUZXh0PSJAMjAyMyBQYW5hZGVyaWEgUG93ZXJlZCBieSBDYXJnaWxscyBJVCIgRm9udD0iQXJpYWwsIDEwcHQsIHN0eWxlPUl0YWxpYyIvPg0KICAgIDwvUGFnZUZvb3RlckJhbmQ+DQogIDwvUmVwb3J0UGFnZT4NCjwvUmVwb3J0Pg0K" Height="100%" Width="100%" />

                       <br />

                       <br />
                       <br />

                       <br />

                       



    <table class="auto-style44">

        
             <br />
                       <br />

                       

        </tr>
        <br />
                       
    </table>

 

    <!-- Display the generated report here -->
    <div id="reportContainer" runat="server" class="mt-3">
        <!-- The report content will be dynamically inserted here -->
    </div>
</div>
        </div>
    </form>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <div>
        
    </div>

    <hr />

    <footer>
                    <p>
                        &copy; <%: DateTime.Now.Year %> - Panaderia Inventory
                        Management system Powered By Cargills IT
                    </p>
                </footer>

</body>
    
</html>


