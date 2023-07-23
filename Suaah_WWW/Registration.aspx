<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Suaah_WWW.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <fieldset>
        <legend dir="auto">Register
        </legend>

        <div style="margin: 20px;">
            <asp:Label ID="f_name_lab" runat="server" Text="First Name" Style="margin-right: 102px;"></asp:Label>
            <asp:TextBox ID="f_name_txt" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="myError" ErrorMessage="Required Field " ControlToValidate="f_name_txt"></asp:RequiredFieldValidator>
             
        </div>

        <div style="margin: 20px;">
            <asp:Label ID="l_name_lab" runat="server" Text="BDate" Style="margin-right: 132px;"></asp:Label>
            <asp:TextBox ID="l_name_txt" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="myError" ErrorMessage="Required Field " ControlToValidate="l_name_txt"></asp:RequiredFieldValidator>
        </div>

        <div style="margin: 20px;">
       
            <asp:Label ID="b_date_lab" runat="server" Text="BDate" Style="margin-right: 160px;"></asp:Label>
            <asp:TextBox ID="b_date_txt" runat="server" TextMode="Date"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="myError" ErrorMessage="Required Field " ControlToValidate="b_date_txt"></asp:RequiredFieldValidator>
        </div>

        <div style="margin: 20px;">
            <asp:Label ID="address_lab" runat="server" Text="Address" Style="margin-right: 120px;"></asp:Label>

            <asp:TextBox ID="address_txt" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required Field " ControlToValidate="address_txt" CssClass="myError"></asp:RequiredFieldValidator>
        </div>

        <div style="margin: 20px;">
            <asp:Label ID="email_lab" runat="server" Text="Email" Style="margin-right: 140px;"></asp:Label>
            <asp:TextBox ID="email_txt" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field " ControlToValidate="email_txt" CssClass="myError"></asp:RequiredFieldValidator>

            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email_txt" CssClass="myError" ErrorMessage=", Enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
        </div>

        <div style="margin: 20px;">
            <asp:Label ID="pass_lab" runat="server" Text="Password" Style="margin-right: 115px;"></asp:Label>
            <asp:TextBox ID="pass_txt" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field " ControlToValidate="pass_txt" CssClass="myError"></asp:RequiredFieldValidator>
        </div>

        <div style="margin: 20px;">
            <asp:Label ID="conf_pass_lab" runat="server" Text="Confirm Password" Style="margin-right: 60px;"></asp:Label>
            <asp:TextBox ID="conf_pass_txt" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="conf_pass_txt" ControlToValidate="pass_txt" CssClass="myError" ErrorMessage="Not match with password"></asp:CompareValidator>
        </div>

        <br />
        <br />

        <asp:Button ID="signup_btn" runat="server" OnClick="signup_btn_Click" Text="Sign Up" Height="40px" Width="103px" />
        <asp:Button ID="cancel_btn" runat="server" CausesValidation="False" Height="40px" OnClick="cancel_btn_Click" Text="Cancel" Width="103px" />
        <br />
        <br />


        <asp:Label ID="register_ex" runat="server"></asp:Label>
    </fieldset>
</asp:Content>
