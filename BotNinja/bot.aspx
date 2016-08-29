<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bot.aspx.cs" Inherits="BotNinja.bot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .hiddenHoneyPots {
            display: none;
        }
    </style>
    <script src="http://crypto-js.googlecode.com/svn/tags/3.0.2/build/rollups/md5.js"></script>
    <script>
        function makeHash() {
            var md5 = function (value) {
                return CryptoJS.MD5(value).toString();
            }

            var today = new Date();
            var dd = today.getDate();
            var mm = today.getMonth() + 1; //January is 0!

            var yyyy = today.getFullYear();
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            var today = mm + '' + dd + '' + yyyy;
            var value = today,
                    hash = md5(value);
            document.getElementById("tbHashWithDate").value = hash;
            console.log(hash);
            
        }
        //makeHash();
        
    </script>
</head>
<body>



    <h2>
        <asp:Label ID="lblResult" runat="server" BackColor="DarkRed" ForeColor="White" Text="not submitted"></asp:Label></h2>
    <div class="matter">
        <div class="container">
            <div class="widget" id="summaryContent">
                <div class="widget-content">
                    <form id="form1" runat="server" class="form-horizontal">
                        <div class="row">
                            <div class="col-lg-12">

                                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                                <asp:TextBox ID="tbAddress" runat="server"></asp:TextBox>
                                <br />

                                <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                <asp:TextBox ID="tbCity" runat="server"></asp:TextBox>
                                <br />


                                <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                <asp:TextBox ID="tbState" runat="server"></asp:TextBox>
                                <br />


                                <asp:Label ID="lblZip" runat="server" Text="Zip"></asp:Label>
                                <asp:TextBox ID="tbZip" runat="server"></asp:TextBox>
                                <br />

                                <asp:Label ID="lblHoneyPots" runat="server" Text="HoneyPots" CssClass="hiddenHoneyPots"></asp:Label>
                                <asp:TextBox ID="tbHoneyPots" runat="server" CssClass="hiddenHoneyPots"></asp:TextBox>


                                <asp:Label ID="lblHashWithDate" runat="server" Text="HoneyPots" CssClass="hiddenHoneyPots"></asp:Label>
                                <asp:TextBox ID="tbHashWithDate" runat="server" CssClass="hiddenHoneyPots"></asp:TextBox>
                                <br />
                                <asp:Button runat="server" ID="btnSubmit" ForeColor="DarkGreen" Text="Submit" OnClick="btnSubmit_Click" OnClientClick="return makeHash();" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

</body>
</html>
