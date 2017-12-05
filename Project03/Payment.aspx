<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Payment.aspx.vb" Inherits="Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Button" />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br/>
            <asp:label ID="lbX" runat="server">Transaction: </asp:label>
            <asp:label ID="Label1" runat="server"></asp:label><br/>
            <asp:label ID="lbAuth" runat="server">Authorization:</asp:label>
            <asp:label ID="Label2" runat="server"></asp:label><br/>
            <asp:label ID="Label3" runat="server"></asp:label>
        </div>
    </form>
</body>
</html>
