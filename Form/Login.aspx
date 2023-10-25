<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx" Inherits="Panaderia.Form.Login" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron" style="background-image: url('Images/background.jpg'); background-size: cover;">
        <div class="container text-center">
            <h2 class="text-center"><strong>Welcome to Cargills Panaderia Inventory System</strong></h2>
            <p class="lead text-center">
                <img src="https://github.com/LasaKaru/Utility-Inquiry-System/blob/main/cargills-removebg-preview.png?raw=true" alt="Cargills Panaderia" width="200" height="100">
            </p>
            <div class="text-center">
                <asp:Button ID="btnShowLogin" runat="server" Text="Login" OnClick="btnShowLogin_Click" Height="25px" Width="100px" ForeColor="Black" OnClientClick="hideJumbotron()" />
            </div>
        </div>
    </div>

    <div class="container text-center">
        <asp:Panel ID="loginForm" runat="server" Visible="false">
            <h4>Please enter user credentials</h4>
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            <br />
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" CssClass="form-control" Width="200px"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Password" CssClass="form-control" Width="200px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CssClass="btn btn-primary" Width="100px" OnClientClick="return validateLoginForm()" />
            <br />
        </asp:Panel>
    </div>

    <script type="text/javascript">
        function hideJumbotron() {
            var jumbotron = document.querySelector('.jumbotron');
            if (jumbotron) {
                jumbotron.style.display = 'none';
            }
        }

        function validateLoginForm() {
            var username = document.getElementById('<%= txtUsername.ClientID %>').value;
            var password = document.getElementById('<%= txtPassword.ClientID %>').value;

            if (username === '' || password === '') {
                alert('Please enter both username and password.');
                return false;
            }

            return true;
        }
    </script>
</asp:Content>