<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="DernierDemande.aspx.cs" Inherits="GestMoveAsp.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 258px;
    }
    .auto-style3 {
        width: 286px;
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
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="IdDemande,IdLycee" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Ville" HeaderText="Ville" SortExpression="Ville" />
                    <asp:BoundField DataField="NomLycee" HeaderText="NomLycee" SortExpression="NomLycee" />
                    <asp:BoundField DataField="IdDemande" HeaderText="IdDemande" ReadOnly="True" SortExpression="IdDemande" />
                    <asp:BoundField DataField="IdLycee" HeaderText="IdLycee" ReadOnly="True" SortExpression="IdLycee" />
                    <asp:BoundField DataField="NumOrdre" HeaderText="NumOrdre" SortExpression="NumOrdre" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GestMoveConnectionString %>" SelectCommand="SELECT     dbo.Lycee.Ville, dbo.Lycee.NomLycee, dbo.Detail_Demande.IdDemande, dbo.Detail_Demande.IdLycee, dbo.Detail_Demande.NumOrdre
FROM         dbo.Detail_Demande INNER JOIN
                      dbo.Lycee ON dbo.Detail_Demande.IdLycee = dbo.Lycee.IdLycee 
where Detail_Demande.IdDemande = (select Top 1 IdDemande from Demande where IdProfesseur =@IdProf order by DateDem desc)
order by Detail_Demande.NumOrdre">
                <SelectParameters>
                    <asp:SessionParameter Name="IdProf" SessionField="ProfConnect" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Verifier Demande" Width="145px" />
        </td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">
            <asp:Label ID="LBL_Message" runat="server" ForeColor="#00CC00" Text="Label"></asp:Label>
        </td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style2">&nbsp;</td>
        <td class="auto-style3">&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</asp:Content>
