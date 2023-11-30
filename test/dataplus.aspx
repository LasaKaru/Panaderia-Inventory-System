<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dataplus.aspx.cs" Inherits="Panaderia.test.dataplus" %>


<!--
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Row to GridView</title>
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
                }
            };

            xhr.send(jsonData);
        }
    </script>
</head>
<body>

<table id="yourGridViewTable" >
    <tr>
        <!-- Your input fields here 
        <td class="auto-style333">
            <input type="text" id="txtitem_nu" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="TextBox2" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtcode" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtDescription" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtPrice" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtPSize" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtPascks" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtNos" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtDis" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtAmount" style="width: 100px;" class="auto-style331">
        </td>

        <!-- ... (repeat for other input fields) 
        <td class="auto-style333">
            <button id="Button1" style="width: 70px;" onclick="addRowToGridView()">+</button>
        </td>
    </tr>
</table>

<button onclick="saveDataToServer()">Save</button>

</body>
</html>


-->


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Row to GridView</title>
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
                    refreshGridView();
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
</head>
<body>
    <div>
<table id="yourGridViewTable" >
    <tr>
        <!-- Your input fields here  -->      

        <td class="auto-style333">
            <input type="text" id="txtitem_nu" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="TextBox2" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtcode" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtDescription" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtPrice" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtPSize" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtPascks" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtNos" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtDis" style="width: 100px;" class="auto-style331">
        </td>

        <td class="auto-style333">
            <input type="text" id="txtAmount" style="width: 100px;" class="auto-style331">
        </td>
        <!-- ... (repeat for other input fields) -->
        <td class="auto-style333">
            <button id="Button1" style="width: 46px;" onclick="addRowToGridView()">+</button>
        </td>
    </tr>
</table>
        
 </div>


    <form id="form2" runat="server" >
    <div style="visibility: visible; overflow: auto; cursor: auto; display: table-column; clip: rect(auto, auto, auto, auto)">
            <asp:GridView ID="yourGridView" runat="server" AutoGenerateColumns="false" BorderColor="#333333" BorderStyle="Solid" BorderWidth="3px" ForeColor="Black" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:BoundField HeaderText="item num" DataField="txtitem_nu" />
                    <asp:BoundField HeaderText="Box2" DataField="TextBox2" />
                    <asp:BoundField HeaderText="code" DataField="txtcode" />
                    <asp:BoundField HeaderText="Description" DataField="txtDescription" />
                    <asp:BoundField HeaderText="Price" DataField="txtPrice" />
                    <asp:BoundField HeaderText="PSize" DataField="txtPSize" />
                    <asp:BoundField HeaderText="Pascks" DataField="txtPascks" />
                    <asp:BoundField HeaderText="Nos" DataField="txtNos" />
                    <asp:BoundField HeaderText="Discount" DataField="txtDis" />
                    <asp:BoundField HeaderText="Amount" DataField="txtAmount" />

                </Columns>
            </asp:GridView>
    </div>

    <br />
    <br />

    <div class="row">
        <div class="col-md-6">

            <button id="btnSave" text="Save" cssclass="btn btn-primary" style="border-style: inset; width: 100px" onclick="saveDataToServer()">Save</button>


            <div class="form-group row">
                <label for="txttotal" class="col-sm-6 col-form-label" style="border-width: thin; background-color: #FFFFFF": width:14px></label>
                <div class="col-sm-50">
                    &nbsp; <input type="text" id="txttotal" class="auto-style326" style="width: 116px"></div>
            </div>



        </div>
    </div>

    </form>
</body>
</html>









