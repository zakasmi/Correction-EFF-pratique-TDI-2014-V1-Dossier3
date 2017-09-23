<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="AjouterDemande.aspx.cs" Inherits="GestMoveAsp.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 160px;
    }
    .auto-style3 {
        width: 177px;
    }
        .auto-style4 {
            width: 160px;
            height: 23px;
        }
        .auto-style5 {
            width: 177px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style1">
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Label ID="Label1" runat="server" Text="Id Demande"></asp:Label>
        </td>
        <td class="auto-style3">
            <asp:TextBox ID="TB_IdDemande" runat="server" Width="153px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ce champs est requis" ForeColor="Red" ControlToValidate="TB_IdDemande">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style4"></td>
        <td class="auto-style5">
            <asp:Label ID="Label2" runat="server"></asp:Label>
        </td>
        <td class="auto-style6"></td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Valider" Width="98px" />
        </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">Nb: Id Prof inserted auto</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
