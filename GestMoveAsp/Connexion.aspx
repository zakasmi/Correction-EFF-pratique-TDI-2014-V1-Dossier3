<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="GestMoveAsp.Connexion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 176px;
        }
        .auto-style4 {
            width: 198px;
        }
        .auto-style5 {
            width: 176px;
            height: 26px;
        }
        .auto-style6 {
            width: 198px;
            height: 26px;
        }
        .auto-style7 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
   
        
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">Connexion</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="Id Prof"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TB_IdProf" runat="server" Width="149px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_IdProf" ErrorMessage="Ce champ est requis" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label2" runat="server" Text="Pass"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TB_Pass" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TB_Pass" ErrorMessage="Ce champ est requis" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="BTN_Connexion" runat="server" OnClick="BTN_Connexion_Click" Text="Connexion" Width="113px" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
