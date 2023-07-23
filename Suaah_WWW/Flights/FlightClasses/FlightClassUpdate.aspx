<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FlightClassUpdate.aspx.cs" Inherits="Suaah_WWW.Flights.FlightClasses.FlightClassUpdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>

        <br />
        <asp:Label ID="class_lb" runat="server" Text="Class"></asp:Label>
&nbsp;<asp:TextBox ID="Class_txt" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="upd_btn" runat="server" Text="Update" OnClick="upd_btn_Click" />
        <br />
                <br />
        <asp:Button ID="del_btn" runat="server" Text="Delete" OnClick="del_btn_Click" />
        <br />
        <br />
        <asp:Label ID="error_lb" runat="server" Font-Bold="False" Font-Size="12pt" ForeColor="#CC0000"></asp:Label>
        <br />
    </div>
</asp:Content>
