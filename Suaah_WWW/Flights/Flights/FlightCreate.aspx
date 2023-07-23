<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FlightCreate.aspx.cs" Inherits="Suaah_WWW.Flights.Flights.FlightCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div>

        <br />
        <asp:Label ID="dGate_lb" runat="server" Text="Departing Gate"></asp:Label>
&nbsp;<asp:TextBox ID="DGate_txt" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="aGate_lb" runat="server" Text="Arrive Gate"></asp:Label>
&nbsp;<asp:TextBox ID="AGate_txt" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="stops_lb" runat="server" Text="Number of stops"></asp:Label>
&nbsp;<asp:TextBox ID="Stops_txt" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="leave_lb" runat="server" Text="Leave time"></asp:Label>
&nbsp;<asp:TextBox ID="Leave_txt" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="airline_lb" runat="server" Text="Airline"></asp:Label>
&nbsp;<asp:DropDownList ID="airline_lst" runat="server" Height="16px" Width="118px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="dAirport_lb" runat="server" Text="Departing Airport"></asp:Label>
&nbsp;<asp:DropDownList ID="DAirport_lst" runat="server" Height="16px" Width="118px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="aAirprt_lb" runat="server" Text="Arriving Airport"></asp:Label>
&nbsp;<asp:DropDownList ID="AAirport_lst" runat="server" Height="16px" Width="118px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="crt_btn" runat="server" Text="Create" OnClick="crt_btn_Click" />
        <br />
        <br />
        <asp:Label ID="error_lb" runat="server" Font-Bold="False" Font-Size="12pt" ForeColor="#CC0000"></asp:Label>
        <br />

    </div>
</asp:Content>
