<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BotNinja._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>spam detection</h1>
    </div>

    <div class="row">
      <div class="col-lg-12">
            <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
              <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox> <br />
      </div>
    </div>
</asp:Content>
