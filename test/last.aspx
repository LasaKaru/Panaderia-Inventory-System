<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="last.aspx.cs" Inherits="Panaderia.test.last" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Product List</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           

            <br />

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowFooter="true">
                <Columns>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" SortExpression="ProductName" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                </Columns>
                <FooterStyle BackColor="#99CCFF" />
                <PagerStyle BackColor="#99CCFF" ForeColor="#003366" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#003366" Font-Bold="True" ForeColor="White" />
            </asp:GridView>

            <br />

            <asp:Button ID="btnAdd" runat="server" Text="+" OnClick="btnAdd_Click" />
            
            <br />

            <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price: $0.00"></asp:Label>
        </div>
    </form>
</body>
</html>
