<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Panaderia.Dashboard" %>



<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <br />
<br />
    <link href="Content/Navigation.css" rel="stylesheet" />
    <div class="jumbotron">
        <style>
            .jumbotron {
                background-image: url('Images/');
                /* Replace with the actual image path */
                background-size: cover;
            }
        </style>
        <p class="lead text-center">
            <img src="cargillstransparent.png" alt="Cargills Panaderia" width="" height="">
        </p>
        <h2 class="text-center"><strong> Panaderia Inventory System</strong></h2>
        <div class="text-center">
            <!-- Center align the contents within this div -->
        </div>
    </div>
</asp:Content>