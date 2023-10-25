   <%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Panaderia._Default" %> 


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Navigation.css" rel="stylesheet" />
    <div class="jumbotron">
        <style>
            .jumbotron {
                background-image: url('Images/');
                /* Replace with the actual image path */
                background-size: cover;
            }
        </style>
        <style>
            .navbar-inverse {
                background-color: #fffbfb;
                border-color: #fdfdfd;
            }
        </style>
        
        <p class="lead text-center">
            <img src="https://github.com/LasaKaru/Utility-Inquiry-System/blob/main/cargills-removebg-preview.png?raw=true" alt="Cargills Panaderia" width="" height="">
        </p>
        <h2 class="text-center"><strong>Welcome to Cargills Panaderia Inventory System</strong></h2>
        <div class="text-center">
            <!-- Center align the contents within this div -->
            <asp:Button ID="btnShowLogin" runat="server" Text="Login" OnClick="btnShowLogin_Click" Height="25px" Width="100px" ForeColor="Black" />
        </div>
        <div class="text-center">
            <!-- Center align the contents within this div -->
            <asp:Panel ID="loginForm" runat="server" Visible="false">
                <h4>Please enter user credentials</h4>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" Height="25px" Width="200px"></asp:TextBox>
                <br />
                <br />
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" Height="25px" Width="200px"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" Height="25px" Width="100px" ForeColor="Black" />
                <br />
            </asp:Panel>
        </div>
    </div>
    <!-- Navigation bar wrapped in a div with ID 'navbarWrapper' -->
    <div id="navbarWrapper">
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <!-- ... Your existing navigation bar code ... -->
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        // Function to hide jumbotron and show background image
        function hideJumbotron() {
            var jumbotron = document.querySelector('.jumbotron');
            if (jumbotron) {
                jumbotron.style.display = 'none';
            }
        }
        window.onload = function () {
            // Check if the body has the 'hide-navigation' class
            if (document.body.classList.contains('hide-navigation')) {
                // Find and hide the navigation bar element
                var navbarWrapper = document.getElementById('navbarWrapper');
                if (navbarWrapper) {
                    navbarWrapper.style.display = 'none';
                }
            }
        };
        // Function to show the navigation bar after successful login
        function showNavigationBar() {
            var navbarWrapper = document.getElementById('navbarWrapper');
            if (navbarWrapper) {
                navbarWrapper.style.display = 'block';
            }
        }
    </script>
    <script type="text/javascript">
        // Function to hide jumbotron and show background image
        function hideJumbotron() {
            var jumbotron = document.querySelector('.jumbotron');
            if (jumbotron) {
                jumbotron.style.display = 'none';
            }
        }
        window.onload = function () {
            // Check if the body has the 'hide-navigation' class
            if (document.body.classList.contains('hide-navigation')) {
                // Find and hide the navigation bar element
                var navigationBar = document.querySelector('.navbar'); // Replace '.navbar' with your actual class or ID
                if (navigationBar) {
                    navigationBar.style.display = 'none';
                }
            }
        };
    </script>
</asp:Content>