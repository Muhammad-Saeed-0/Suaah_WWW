<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FlightsClasses.aspx.cs" Inherits="Suaah_WWW.Flights.FlightsClasses.FlightsClasses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>

        <br />
        <asp:GridView ID="flightsClasses_gr" runat="server" Width="75%" AutoGenerateSelectButton="True" OnSelectedIndexChanged="flightClasses_gr_SelectedIndexChanged" CellPadding="3" GridLines="Horizontal" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" >
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <SortedAscendingCellStyle BackColor="#F4F4FD" />
            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
            <SortedDescendingCellStyle BackColor="#D8D8F0" />
            <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
        <br />
        <asp:Button ID="crt_btn" runat="server" OnClick="crt_btn_Click" Text="Create" />
        <br />

    </div>
</asp:Content>
