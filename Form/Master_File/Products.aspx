<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="Panaderia.Form.Master_File.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

     <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title> Masterfiles - Products </title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

     <!--Bootstrap JavaScript -->
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
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="date" runat="server" CssClass="input-field" ForeColor="#000000"></asp:TextBox></div>
    <div class="table-cell header" style="background-color: #eb1f10; width: 150px; font-weight: bold; ">User</div>
    <div class="table-cell" style="background-color: #eb1f10; width: 300px;"><asp:TextBox ID="user" runat="server" CssClass="input-field"></asp:TextBox></div>
  </div>
</div>>

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

                    <label for="txtCode" class="col-sm-4 col-form-label">Code</label>

                    <div class="col-sm-8">

                    <asp:TextBox ID="txtCode" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtcode" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>


                    </div>                    

                </div>

 

                <div class="form-group row">

                    <label for="txtType" class="col-sm-4 col-form-label">Type</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtType" runat="server" CssClass="auto-style326" ReadOnly="true"></asp:TextBox>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtType" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                    <div class="col-sm-6">                      

                         <asp:DropDownList ID="ddltype" runat="server" onchange="updatetypeText()" Width="100px" CssClass="form-control">

                             <asp:ListItem Text="Finished Good" Value="F"></asp:ListItem>

                             <asp:ListItem Text="Raw Meterial" Value="R"></asp:ListItem>

                             <asp:ListItem Text="Services" Value="S"></asp:ListItem>

                         </asp:DropDownList>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtdescription" class="col-sm-4 col-form-label">Description</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtdescription" runat="server" CssClass="form-control"></asp:TextBox>

                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtdescription" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>
                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtunitsize" class="col-sm-4 col-form-label">Unit Size</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtUnitSize" runat="server" CssClass="form-control"></asp:TextBox>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtUnitSize" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                </div>

 

 

                <div class="form-group row">

                    <label for="txtUnitInCase" class="col-sm-4 col-form-label">Unit In Case</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtUnitInCase" runat="server" CssClass="form-control"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtUnitInCase" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtUOM" class="col-sm-4 col-form-label">UOM</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtUOM" runat="server" CssClass="auto-style326" ReadOnly="true"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtUOM" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>                  

                     <div class="col-sm-6">                      

                         <asp:DropDownList ID="ddlUOM" runat="server" onchange="updateUOMText()" Width="100px" CssClass="form-control">

                             <asp:ListItem Text="EA" Value="1"></asp:ListItem>

                             <asp:ListItem Text="KG" Value="2"></asp:ListItem>

                             <asp:ListItem Text="LT" Value="3"></asp:ListItem>

                         </asp:DropDownList>

                    </div>

                </div>

                <br />

 

                <div class="form-group row">

                    <label for="txtCate1" class="col-sm-4 col-form-label">Category 1</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtCate1" runat="server" CssClass="auto-style326" ReadOnly="true"></asp:TextBox>

                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtCate1" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                    <div class="col-sm-6">                      

                         <asp:DropDownList ID="ddlcate1" runat="server" onchange="updatecate1Text()" Width="100px" CssClass="form-control">

                             <asp:ListItem Text="Breverage" Value="1"></asp:ListItem>

                             <asp:ListItem Text="Meal" Value="2"></asp:ListItem>

                             <asp:ListItem Text="Other" Value="3"></asp:ListItem>

                         </asp:DropDownList>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtCate2" class="col-sm-4 col-form-label">Category 2</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtCate2" runat="server" CssClass="auto-style326" ReadOnly="true"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtCate2" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                   

                     <div class="col-sm-6">                      

                         <asp:DropDownList ID="ddlcate2" runat="server" onchange="updatecate2Text()" Width="100px" CssClass="form-control">

                             <asp:ListItem Text="Breverage" Value="1"></asp:ListItem>

                             <asp:ListItem Text="Meal" Value="2"></asp:ListItem>

                             <asp:ListItem Text="Other" Value="3"></asp:ListItem>

                         </asp:DropDownList>

                    </div>

                </div>

 

 

                <div class="form-group row">

                    <label for="txtCate3" class="col-sm-4 col-form-label">Category 3</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtCate3" runat="server" CssClass="auto-style326" ReadOnly="true"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtCate3" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                     <div class="col-sm-6">                      

                         <asp:DropDownList ID="ddlcate3" runat="server" onchange="updatecate3Text()" Width="100px" CssClass="form-control">

                             <asp:ListItem Text="Breverage" Value="1"></asp:ListItem>

                             <asp:ListItem Text="Meal" Value="2"></asp:ListItem>

                             <asp:ListItem Text="Other" Value="3"></asp:ListItem>

                         </asp:DropDownList>

                    </div>

                </div>

 

 

                <div class="form-group row">

                    <label for="txtCate4" class="col-sm-4 col-form-label">Category 4</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtCate4" runat="server" CssClass="auto-style326" ReadOnly="true"></asp:TextBox>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtCate4" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

 

                     <div class="col-sm-6">                      

                         <asp:DropDownList ID="ddlcate4" runat="server" onchange="updatecate4Text()" Width="100px" CssClass="form-control">

                             <asp:ListItem Text="Breverage" Value="1"></asp:ListItem>

                             <asp:ListItem Text="Meal" Value="2"></asp:ListItem>

                             <asp:ListItem Text="Other" Value="3"></asp:ListItem>

                         </asp:DropDownList>

                    </div>

                </div>

 

                <div class="form-group row">

                    <label for="txtSTDCostPrice" class="col-sm-4 col-form-label">STD Cost Price </label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtSTDCostPrice" runat="server" CssClass="form-control"></asp:TextBox>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtSTDCostPrice" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                </div>

                <br />

 

                <div class="form-group row">

                    <label for="txtSTDSellingPrice" class="col-sm-4 col-form-label">STD Selling Price</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtSTDSellingPrice" runat="server" CssClass="form-control"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtSTDSellingPrice" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                </div>     

 

                <div class="form-group row">

                    <label for="txtMaximumMarkup" class="col-sm-4 col-form-label">Maximum Markup%</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtMaximumMarkup" runat="server" CssClass="form-control"></asp:TextBox>

                         <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtMaximumMarkup" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                </div>

 

 

                <div class="form-group row">

                    <label for="txtNBT" class="col-sm-4 col-form-label">NBT %</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtNBT" runat="server" CssClass="form-control" OnTextChanged="txtNBT_TextChanged"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtNBT" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                </div>

                <br />

 

 

                <div class="form-group row">

                    <label for="txtVAT" class="col-sm-4 col-form-label">VAT %</label>

                    <div class="col-sm-8">

                        <asp:TextBox ID="txtVAT" runat="server" CssClass="form-control"></asp:TextBox>

                       <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Required." ForeColor="Red" ControlToValidate="txtVAT" Display="Dynamic" ValidationGroup="valGrpCreate"></asp:RequiredFieldValidator>

                    </div>

                </div>

                <br />

 
                <!--
                 <div class="form-group row">

                    <label for="txtTaxCode" class="col-sm-4 col-form-label">Tax Code</label>

                    <div class="col-sm-2">

                        <asp:TextBox ID="txtTaxCode" runat="server" CssClass="auto-style326" ReadOnly="true" OnTextChanged="txtTaxCode_TextChanged"></asp:TextBox>

                    </div>

                    <div class="col-sm-6">                      

                         <asp:DropDownList ID="ddlTaxCode" runat="server" onchange="taxcodeText()" Width="100px" CssClass="form-control">

                             <asp:ListItem Text="EA" Value="1"></asp:ListItem>

                             <asp:ListItem Text="KG" Value="2"></asp:ListItem>

                             <asp:ListItem Text="LT" Value="3"></asp:ListItem>

                        </asp:DropDownList>

                    </div>

                </div>
                -->
 

                <div class="form-group row">
                    <label for="txtUserStatus" class="col-sm-4 col-form-label">Status</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtactiveStatus" runat="server" CssClass="auto-style326" ReadOnly="true"></asp:TextBox>
                    </div>                   
                    <div class="col-sm-6">                       
                         <asp:DropDownList ID="ddlactiveStatus" runat="server" onchange="updateUserStatusText()" Width="100px" CssClass="form-control">
                             <asp:ListItem Text="Active" Value="A"></asp:ListItem>
                             <asp:ListItem Text="Deleted" Value="D"></asp:ListItem>                            
                         </asp:DropDownList>

                    </div>

                </div>

            </div>

 

            <div class="col-md-6">

                <div class="form-group row">

                    <asp:FileUpload ID="myFile" runat="server" />

                </div>

            </div>

 

 

        </div>

    </div>

        <br />

        <br />

 

        <div class="row">

            <div class="col-md-6">

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:Button ID="btn_save" runat="server" CssClass="btn btn-primary"   Text="Save" ValidationGroup="valGrpCreate"  OnClick="btn_save_Click" Style="border-style: inset; width: 100px"/>

          &nbsp;<button type="button" id="browseButton" class="btn btn-secondary" style="width: 100px;">Browse</button>

                <div id="myModal" class="modal">

                    <div class="modal-content">

                        <div class="modal-content-container" style="overflow: auto">

                            <!-- Modal header with a close button -->

                            <div class="modal-header">

                                <h2>Product Details </h2>

                                <button id="closeModal">* Click outside to Close</button>

                            </div>

                            <!-- GridView -->

                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="True"></asp:GridView>

 

                            <!-- Placeholder for the GridView -->

                            <div id="gridViewPlaceholder"></div>

                        </div>

                    </div>

                </div>

          &nbsp;
                
                
                <asp:Button
            ID="btnexit"
            Text="Exit"
            CssClass="btn btn-danger"
            OnClick="btnExit_Click"
            runat="server"
            Style="border-style: inset; width: 100px"
        />

            </div>

        </div>  

        </form>
    


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

            var txtCodeInput = document.getElementById('txtCode');

            var txtTypeInput = document.getElementById('txtType');

            var txtdescriptionInput = document.getElementById('txtdescription');

            var txtUnitsizeInput = document.getElementById('txtUnitSize');

            var txtUnitInCaseInput = document.getElementById('txtUnitInCase');

            var txtUOMInput = document.getElementById('txtUOM');

            var txtCate1Input = document.getElementById('txtCate1');
            var txtCate2Input = document.getElementById('txtCate2');
            var txtCate3Input = document.getElementById('txtCate3');
            var txtCate4Input = document.getElementById('txtCate4');

            var txtSTDCostPriceInput = document.getElementById('txtSTDCostPrice');

            var txtSTDSellingPriceInput = document.getElementById('txtSTDSellingPrice');

            var txtMaximumMarkupInput = document.getElementById('txtMaximumMarkup');

            var txtNBTInput = document.getElementById('txtNBT');

            var txtVATInput = document.getElementById('txtVAT');
            
            var txtUserStatus = document.getElementById('txtUserStatus');


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

                txtTypeInput.value = cells[1].textContent;

                txtdescriptionInput.value = cells[2].textContent;

                txtUnitsizeInput.value = cells[3].textContent;

                txtUnitInCaseInput.value = cells[4].textContent;

                txtUOMInput.value = cells[5].textContent;

                txtCate1Input.value = cells[6].textContent;
                txtCate2Input.value = cells[7].textContent;
                txtCate3Input.value = cells[8].textContent;
                txtCate4Input.value = cells[9].textContent;

                txtSTDCostPriceInput.value = cells[10].textContent;

                txtSTDSellingPriceInput.value = cells[11].textContent;

                txtMaximumMarkupInput.value = cells[12].textContent;

                txtNBTInput.value = cells[13].textContent;

                txtVATInput.value = cells[14].textContent;
                
                txtUserStatus.value = cells[15].textContent;

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

        function updatetypeText() {

            var dropdown = document.getElementById("ddltype");

            var selectedText = dropdown.options[dropdown.selectedIndex].text;

            document.getElementById("txtType").value = selectedText;

        }

        function updateUOMText() {

            var dropdown = document.getElementById("ddlUOM");

            var selectedText = dropdown.options[dropdown.selectedIndex].text;

            document.getElementById("txtUOM").value = selectedText;

        }

        function updatecate1Text() {

            var dropdown = document.getElementById("ddlcate1");

            var selectedText = dropdown.options[dropdown.selectedIndex].text;

            document.getElementById("txtCate1").value = selectedText;

        }

        function updatecate2Text() {

            var dropdown = document.getElementById("ddlcate2");

            var selectedText = dropdown.options[dropdown.selectedIndex].text;

            document.getElementById("txtCate2").value = selectedText;

        }

        function updatecate3Text() {

            var dropdown = document.getElementById("ddlcate3");

            var selectedText = dropdown.options[dropdown.selectedIndex].text;

            document.getElementById("txtCate3").value = selectedText;

        }

        function updatecate4Text() {

            var dropdown = document.getElementById("ddlcate4");

            var selectedText = dropdown.options[dropdown.selectedIndex].text;

            document.getElementById("txtCate4").value = selectedText;

        }

        function taxcodeText() {

            var dropdown = document.getElementById("ddlTaxCode");

            var selectedText = dropdown.options[dropdown.selectedIndex].text;

            document.getElementById("txtTaxCode").value = selectedText;

        }

        function updateUserStatusText() {

            var dropdown = document.getElementById("ddlUserStatus");

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

        <br />
        <br />
        <hr />
        
        <footer>
                    <p>
                        &copy; <%: DateTime.Now.Year %> - Panaderia Inventory
                        Management system Powered By Cargills IT
                    </p>
                </footer>


    </div>

     

</body>
</html>
