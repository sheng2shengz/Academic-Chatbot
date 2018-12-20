<%@ Page Title="New User" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="True" CodeBehind="NewUser.aspx.cs" Inherits="Academic_Chatbot.NewUser" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="py-5 text-center">
            <asp:Image ID="User_Image" CssClass="d-block mx-auto mb-4" Width="80" Height="80" ImageUrl="~/Image/user1.png" runat="server" />
            <h2>Create User</h2>
        </div>
        <div class="text-center" style="font-size:initial">
            <div class="row">
                <div class="col-md-2 mb-3">
                    <asp:Label ID="Title_Label" Text="Title" runat="server"></asp:Label>
                    <asp:DropDownList ID="Title_DropDownList" CssClass="form-control" runat="server">
                        <asp:ListItem Value="">Title</asp:ListItem>
                        <asp:ListItem Value="Mr">Mr</asp:ListItem>
                        <asp:ListItem Value="Mrs">Mrs</asp:ListItem>
                        <asp:ListItem Value="Miss">Miss</asp:ListItem>
                        <asp:ListItem Value="Dr">Dr</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-5 mb-3">
                    <asp:Label ID="FirstName_Label" runat="server">First Name</asp:Label>
                    <asp:TextBox ID="FirstName_TextBox" CssClass="form-control" TextMode="SingleLine" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-5 mb-3">
                    <asp:Label ID="LastName_Label" runat="server">Last Name</asp:Label>
                    <asp:TextBox ID="LastName_TextBox" CssClass="form-control" TextMode="SingleLine" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="mb-3">
                <asp:Label ID="Email_Label" runat="server">Email</asp:Label>
                <asp:TextBox ID="Email_TextBox" CssClass="form-control" TextMode="SingleLine"  runat="server"></asp:TextBox>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <asp:Label ID="Password_Label" runat="server">Password</asp:Label>
                    <asp:TextBox ID="Password_TextBox" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6 mb-3">
                    <asp:Label ID="ConfirmPassword_Label" runat="server">Confirm Password</asp:Label>
                    <asp:TextBox ID="ConfirmPassword_TextBox" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="mb-3">
                <asp:Label ID="Role_Label" runat="server">Role</asp:Label>
                <asp:DropDownList ID="Role_DropDownList" CssClass="form-control" runat="server">
                    <asp:ListItem Value="1">Admin</asp:ListItem>
                    <asp:ListItem Value="2">FYP Coordinator</asp:ListItem>
                    <asp:ListItem Value="3">LI Coordinator</asp:ListItem>
                </asp:DropDownList>
            </div>
            <br />
            <asp:Button ID="Submit_Button" CssClass="col-4 btn btn-primary btn-lg" Text="Submit" OnClick="Submit_Button_OnClick" runat="server" />
        </div>
    </div>
</asp:Content>
