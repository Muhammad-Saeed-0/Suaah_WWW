<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FlightsClassesCreate.aspx.cs" Inherits="Suaah_WWW.Flights.FlightsClasses.FlightsClassesCreate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <br />
        <asp:Label ID="price_lb" runat="server" Text="Price"></asp:Label>
&nbsp;<asp:TextBox ID="price_txt" runat="server" TextMode="Number"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="flight_lb" runat="server" Text="Flight"></asp:Label>
&nbsp;<asp:DropDownList ID="Flight_lst" runat="server" Height="33px" Width="118px">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="class_lb" runat="server" Text="Class"></asp:Label>
&nbsp;<asp:DropDownList ID="Class_lst" runat="server" Height="33px" Width="118px">
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
