<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="DetailDemande.aspx.cs" Inherits="GestMoveAsp.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 199px;
        }
        .auto-style3 {
            width: 199px;
            height: 39px;
        }
        .auto-style4 {
            height: 39px;
        }
        .auto-style5 {
            width: 199px;
            height: 30px;
        }
        .auto-style6 {
            height: 30px;
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
            <td class="auto-style5">
                <asp:Label ID="Label1" runat="server" Text="Id Demande"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:TextBox ID="TB_IdDemande" runat="server" Width="144px"></asp:TextBox>
            </td>
            <td class="auto-style6"></td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label3" runat="server" Text="Lycee"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:DropDownList ID="DropDownList1"  runat="server" DataSourceID="SqlDataSource1" DataTextField="NomLycee" DataValueField="IdLycee" Height="16px" Width="160px">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Ce Champs est Requis"></asp:RequiredFieldValidator>
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
                <asp:Label ID="LBL_Info" runat="server"></asp:Label>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>
                <asp:Button ID="BTN_Ajouter" runat="server" OnClick="BTN_Ajouter_Click" Text="Ajouter" Width="128px" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestMoveConnectionString %>" SelectCommand="SELECT [IdLycee], [NomLycee] FROM [Lycee]"></asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
