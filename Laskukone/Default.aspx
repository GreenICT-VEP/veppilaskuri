<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    &nbsp;<asp:TextBox ID="TextBoxEka" runat="server"></asp:TextBox>
&nbsp;&nbsp;<asp:DropDownList ID="DropDownListLasku" runat="server">
            <asp:ListItem>+</asp:ListItem>
            <asp:ListItem>-</asp:ListItem>
            <asp:ListItem>*</asp:ListItem>
            <asp:ListItem>/</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;<asp:TextBox ID="TextBoxToka" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="ButtonTulos" runat="server" OnClick="ButtonTulos_Click" Text="=" />
        <br />
        <br />
        <asp:TextBox ID="TextBoxTulos" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
        &nbsp;
        <asp:Button ID="ButtonNollaa" runat="server" OnClick="ButtonNollaa_Click" Text="Nollaa" />
    
    </div>
    </form>
</body>
</html>
