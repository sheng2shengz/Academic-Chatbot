<%@Page Title="Login" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="~/Login.aspx.cs" Inherits="Academic_Chatbot.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <div class="form-signin row justify-content-md-center">
            <asp:Image ID="AcabotLogo_Image" CssClass="mb-4" Height="150" Width="150" ImageUrl="~/Image/AcabotLogo.png" runat="server"/>
            <asp:Label ID="SignIn_Label" CssClass="h3 mb-3 font-weight-normal" Width="100%" runat="server">Sign In</asp:Label>
            <asp:TextBox ID="EmailAddress_TextBox" CssClass="form-control" TextMode="Email" placeholder="Email address" runat="server"></asp:TextBox>
            <asp:TextBox ID="Password_TextBox" CssClass="form-control" TextMode="Password" PlaceHolder="Password" runat="server"></asp:TextBox>
            <asp:Button ID="SignIn_Button" CssClass="mt-3 btn btn-lg btn-primary btn-block shadow" runat="server" Text="Sign In" />
        </div>
    </div>

</asp:Content>




