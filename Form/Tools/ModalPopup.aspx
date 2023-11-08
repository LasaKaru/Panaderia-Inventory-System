<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModalPopup.aspx.cs" Inherits="Panaderia.Form.Tools.ModalPopup" %>

<!DOCTYPE html>
<html>
<head>
    <title>Modal Popup</title>

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
</head>
<body>
    <form runat="server">
        <!-- Input fields -->
        <div>
            <label for="transactionID">Transaction ID:</label>
            <input type="text" id="transactionID" placeholder="Enter Transaction ID">
        </div>
        <div>
            <label for="companyID">Company ID:</label>
            <input type="text" id="companyID" placeholder="Enter Company ID">
        </div>
        <div>
            <label for="branchID">Branch ID:</label>
            <input type="text" id="branchID" placeholder="Enter Branch ID">
        </div>
        <div>
            <label for="transactionType">Transaction Type:</label>
            <input type="text" id="transactionType" placeholder="Enter Transaction Type">
        </div>

        <button id="browseButton">Browse</button>
        <!-- Modal popup -->
        <div id="myModal" class="modal">
            <div class="modal-content">
                <div class="modal-content-container" style="overflow: auto">               
                <!-- Modal header with a close button -->
                <div class="modal-header">                 
                    <h2>Modal Popup Rename It ;)< </h2>
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
    </form>
    <script>
        // JavaScript code to display data in the modal
        var browseButton = document.getElementById('browseButton');
        var modal = document.getElementById('myModal');
        var closeModalButton = document.getElementById('closeModal');
        var dataBody = document.getElementById('<%= GridView1.ClientID %>');
        var selectedRow = null;

        // Input fields
        var transactionIDInput = document.getElementById('transactionID');
        var companyIDInput = document.getElementById('companyID');
        var branchIDInput = document.getElementById('branchID');
        var transactionTypeInput = document.getElementById('transactionType');

        // Function to handle row selection and highlight
        function selectRow(row, rowData) {
            if (selectedRow) {
                selectedRow.classList.remove('selected-row');
            }
            row.classList.add('selected-row');
            selectedRow = row;

            //closeModelButton.click();
            // Populate the input fields with the selected row's data
            var cells = row.cells;
            transactionIDInput.value = cells[0].textContent;
            companyIDInput.value = cells[1].textContent;
            branchIDInput.value = cells[2].textContent;
            transactionTypeInput.value = cells[3].textContent;
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

        // JavaScript code for searching data
        var searchButton = document.getElementById('searchButton');
        var searchInput = document.getElementById('searchInput');

        searchButton.addEventListener('click', function () {
            var searchCriteria = searchInput.value;

            // Send the search criteria to the server for data retrieval
            // You can use AJAX to call a server-side method or API to fetch filtered data

            // Example using jQuery for AJAX
            $.ajax({
                type: 'POST',
                url: 'YourSearchEndpoint', // Replace with your server-side endpoint
                data: { searchCriteria: searchCriteria },
                success: function (data) {
                    // Update the modal content with the filtered data
                    loadData(data);
                },
                error: function (error) {
                    // Handle any errors here
                }
            });
        });

        function loadData(data) {
            var dataBody = document.getElementById('data-body');
            dataBody.innerHTML = ''; // Clear the existing data

            data.forEach(function (rowData) {
                var row = document.createElement('tr');
                var cell1 = document.createElement('td');
                cell1.innerHTML = rowData.Column1;
                var cell2 = document.createElement('td');
                cell2.innerHTML = rowData.Column2;
                // Add more cells for additional columns

                row.appendChild(cell1);
                row.appendChild(cell2);
                dataBody.appendChild(row);

                row.addEventListener('click', function () {
                    selectRow(row, rowData);
                });
            });
        }

        var searchButton = document.getElementById('searchButton');
        var searchInput = document.getElementById('searchInput');

        searchButton.addEventListener('click', function () {
            var searchCriteria = searchInput.value;

            $.ajax({
                type: 'POST',
                url: 'ModalPopup.aspx/SearchData', // Your server-side method
                data: JSON.stringify({ searchCriteria: searchCriteria }),
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (data) {
                    loadData(data.d); // Assuming your JSON result contains a property 'd' that holds the data
                },
                error: function (error) {
                    // Handle any errors here
                }
            });
        });



    </script>
</body>
</html>
