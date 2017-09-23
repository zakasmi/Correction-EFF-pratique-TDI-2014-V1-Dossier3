<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Nombre Demande Web Serv.aspx.cs" Inherits="GestMoveAsp.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 179px;
    }
    .auto-style3 {
        width: 179px;
        height: 23px;
    }
    .auto-style4 {
        height: 23px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Label ID="Label1" runat="server" Text="Id Prof"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style3">
            <asp:Label ID="Label2" runat="server" Text="Nombre De Mutation"></asp:Label>
        </td>
        <td class="auto-style4">
            <asp:Label ID="Label3" runat="server"></asp:Label>
        </td>
        <td class="auto-style4"></td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Afficher" Width="112px" />
        </td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
