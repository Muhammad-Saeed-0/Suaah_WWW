<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Flights.aspx.cs" Inherits="Suaah_WWW.Flights.Flights.Flights" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>

        <br />
        <asp:GridView ID="flights_gr" runat="server" Width="75%" AutoGenerateSelectButton="True" OnSelectedIndexChanged="flights_gr_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
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
        <br />
        <asp:Button ID="crt_btn" runat="server" OnClick="crt_btn_Click" Text="Create" />
        <br />

    </div>
</asp:Content>
