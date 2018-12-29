﻿<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Academic_Chatbot.Accounts" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="pb-3 text-center">
            <asp:Image ID="UserManagement_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Image/UserManagement.png" runat="server" />
            <h2>User Management</h2>
        </div>
        <div class="jumbotron shadow row justify-content-md-center m-3 p-3">
            <div class="col align-self-center col-lg-1 text-center" style="cursor:pointer">
                <asp:ImageButton ID="CreateUser_Button" CssClass="row rounded-circle btn btn-light shadow-lg p-1" BorderColor="Black" BorderWidth="2px" ToolTip="Create User" ImageUrl="~/Image/users.png" Width="75" Height="75" OnClick="CreateUser_Button_OnClick" runat="server" />  
                <asp:Label ID="CreateUser_Label" CssClass="row h7 text-center font-weight-light" runat="server">Create User</asp:Label>                
            </div>
            <div class="col align-self-center col-lg-2 mx-3 text-center">
                <h6 class="row justify-content-center">Existing Users: <b>4</b></h6>
                <br />
                <h6 class="row justify-content-center">Existing Roles: <b>3</b></h6>
            </div>
            <div class="col align-self-center col-lg-1 text-center" style="cursor:pointer">
                <asp:ImageButton ID="ChangePassword_Button" CssClass="row rounded-circle btn btn-danger shadow-lg p-1" BorderColor="Black" BorderWidth="2px" ToolTip="Change Password" ImageUrl="~/Image/Password1.png" Width="75" Height="75" runat="server" />  
                <asp:Label ID="ChangePassword_Label" CssClass="row h7 text-center text-nowrap font-weight-light" runat="server">Change Password</asp:Label>                
            </div>
        </div>
        <div class="m-3">
            <table class="table table-striped">
              <thead>
                <tr>
                    <th>#</th>
                    <th>Role</th>
                    <th>Email Address</th>
                    <th>Title</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Created Date</th>
                    <th></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <th>1</th>
                    <td>Admin</td>
                    <td>asdfasba@gmail.com</td>
                    <td>Mr</td>
                    <td>ipsum</td>
                    <td>dolor</td>
                    <td>11.1.2017</td>
                    <td>
                        <asp:LinkButton ID="Edit_LinkButton" Text="Edit" CssClass="mr-1" Font-Underline="true" OnClick="Edit_LinkButton_OnClick" runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="Delete_LinkButton" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                  <th>2</th>
                    <td>FYP Coordinator</td>
                    <td>iuogndg@gmail.com</td>
                  <td>Dr</td>
                  <td>consectetur</td>
                  <td>adipiscing</td>
                  <td>12.06.2017</td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" Text="Edit" CssClass="mr-1" Font-Underline="true" runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                  <th>3</th>
                    <td>LI Coordinator</td>
                    <td>ppedmx@gmail.com</td>
                  <td>Miss</td>
                  <td>nec</td>
                  <td>odio</td>
                  <td>30.5.2017</td>
                    <td>
                        <asp:LinkButton ID="LinkButton3" Text="Edit" CssClass="mr-1" Font-Underline="true" runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                  <th>4</th>
                    <td>Admin</td>
                    <td>123ghis@gmail.com</td>
                  <td>Mrs</td>
                  <td>Sed</td>
                  <td>cursus</td>
                  <td>23.4.2017</td>
                    <td>
                        <asp:LinkButton ID="LinkButton5" Text="Edit" CssClass="mr-1" Font-Underline="true" runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton6" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                    </td>
                </tr>
              </tbody>
            </table>
        </div>

    </div>
</asp:Content>
