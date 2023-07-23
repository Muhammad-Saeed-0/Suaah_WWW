<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="Suaah_WWW.Hotel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
	<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-hover table-condensed"
		DataKeyNames="Id" AutoGenerateSelectButton="true" AllowPaging="True" pagesize ="5"/>
 
	<asp:SqlDataSource ID="SqlDataSource1" runat="server"
		ConnectionString="<%$ ConnectionStrings: Suaah_WWWConnectionString %>"
		SelectCommand="select * from Hotel" />

	<%--    --%>

	<asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" CssClass="table table-hover table-condensed"
		DataKeyNames="Id" AutoGenerateSelectButton="true" AllowPaging="True" pagesize ="5"  />


	<asp:SqlDataSource ID="SqlDataSource2" runat="server"
		ConnectionString="<%$ ConnectionStrings: Suaah_WWWConnectionString %>"
		SelectCommand="select * from HotelRoom WHERE HotelId=@Id" >
		
	<SelectParameters>
		   <asp:ControlParameter Name="Id" ControlID="GridView1" />
	</SelectParameters>

	</asp:SqlDataSource>

	<%--    --%>
	
	<asp:GridView ID="GridView3" runat="server" DataSourceID="SqlDataSource3" CssClass="table table-hover table-condensed"
		DataKeyNames="Name" AutoGenerateSelectButton="true" AllowPaging="True" pagesize ="5"  />


	<asp:SqlDataSource ID="SqlDataSource3" runat="server"
		ConnectionString="<%$ ConnectionStrings: Suaah_WWWConnectionString %>"
		SelectCommand="SELECT Name
						FROM Services
						where Id in(
							select ServicesId 
							from HotelRoomServices
							where HotelRoomId =@Id)" >
		
	<SelectParameters>
		   <asp:ControlParameter Name="Id" ControlID="GridView2" />
	</SelectParameters>

	</asp:SqlDataSource>

	<%--    --%>

</asp:Content>
