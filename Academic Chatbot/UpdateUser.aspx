﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="Academic_Chatbot.UpdateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:ImageButton ID="back_ImageButton" CssClass="" Height="40" Width="40" ImageUrl="~/Images/back.png" OnClick="back_ImageButton_OnClick" CausesValidation="False" runat="server" />
        <div class="py-5 text-center">
            <asp:Image ID="User_Image" CssClass="d-block mx-auto mb-4" Width="80" Height="80" ImageUrl="~/Images/user1.png" runat="server" />
            <h2>Update User</h2>
        </div>
        <div class="text-center" style="font-size: initial">
            <div class="row">
                <div class="col-md-2 mb-3">
                    <asp:Label ID="Title_Label" Text="Title" runat="server"></asp:Label>
                    <asp:DropDownList ID="Title_DropDownList" CssClass="form-control" runat="server">
                        <asp:ListItem Value="" Hidden>Title</asp:ListItem>
                        <asp:ListItem Value="Mr">Mr</asp:ListItem>
                        <asp:ListItem Value="Mrs">Mrs</asp:ListItem>
                        <asp:ListItem Value="Miss">Miss</asp:ListItem>
                        <asp:ListItem Value="Dr">Dr</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="Title_DropDownList_RequiredValidator" InitialValue="" ControlToValidate="Title_DropDownList" ErrorMessage="Please select a title" CssClass="mx-auto text-danger" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-5 mb-3">
                    <asp:Label ID="FirstName_Label" runat="server">First Name</asp:Label>
                    <asp:TextBox ID="FirstName_TextBox" CssClass="form-control" TextMode="SingleLine" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="FirstName_RequiredValidator" ControlToValidate="FirstName_TextBox" ErrorMessage="This field is required" CssClass="mx-auto text-danger" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-md-5 mb-3">
                    <asp:Label ID="LastName_Label" runat="server">Last Name</asp:Label>
                    <asp:TextBox ID="LastName_TextBox" CssClass="form-control" TextMode="SingleLine" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="LastName_RequiredValidator" ControlToValidate="LastName_TextBox" ErrorMessage="This field is required" CssClass="mx-auto text-danger" runat="server"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="mb-3">
                <asp:Label ID="Email_Label" runat="server">Email</asp:Label>
                <asp:TextBox ID="Email_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Email_RequiredValidator" Display="Dynamic" ControlToValidate="Email_TextBox" ErrorMessage="This field is required" CssClass="mx-auto text-nowrap text-danger" runat="server"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="Email_RegExValidator" Display="Dynamic" ControlToValidate="Email_TextBox" CssClass="mx-auto text-danger" ValidationExpression="^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$" ErrorMessage="Invalid email format" runat="server"></asp:RegularExpressionValidator>
            </div>
            <div class="form-row mb-3">
                <div class="col-md-6">
                    <asp:Label ID="Password_Label" runat="server">Password</asp:Label>
                    <asp:TextBox ID="Password_TextBox" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="ConfirmPassword_Label" runat="server">Confirm Password</asp:Label>
                    <asp:TextBox ID="ConfirmPassword_TextBox" CssClass="form-control" TextMode="Password" runat="server"></asp:TextBox>
                </div>
                <asp:CompareValidator ID="PasswordConfirmPassword_CompareValidator" Display="Dynamic" ControlToCompare="ConfirmPassword_TextBox" ControlToValidate="Password_TextBox" ErrorMessage="Password not match" CssClass="mx-auto text-danger" runat="server"></asp:CompareValidator>
                <asp:CompareValidator ID="PasswordConfirmPassword_CompareValidator1" ControlToCompare="Password_TextBox" ControlToValidate="ConfirmPassword_TextBox" runat="server"></asp:CompareValidator>
            </div>
            <div class="mb-3">
                <asp:Label ID="Role_Label" runat="server">Role</asp:Label>
                <asp:DropDownList ID="Role_DropDownList" CssClass="form-control" runat="server">
                    <asp:ListItem Value="" Hidden>Role</asp:ListItem>
                    <asp:ListItem Value="Admin">Admin</asp:ListItem>
                    <asp:ListItem Value="FYP Coordinator">FYP Coordinator</asp:ListItem>
                    <asp:ListItem Value="LI Coordinator">LI Coordinator</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="Role_DropDownList_RequiredValidator" InitialValue="" ControlToValidate="Role_DropDownList" ErrorMessage="Please select a role" CssClass="mx-auto text-danger" runat="server"></asp:RequiredFieldValidator>
            </div>
            <br />
            <asp:Button ID="Submit_Button" CssClass="col-4 btn btn-primary btn-lg" Text="Update" runat="server" OnClick="Submit_Button_Click" />
        </div>
    </div>

    <script type="text/javascript">

        //set the interval for checking the validators
        setInterval(function () { colorBorders() }, 100);

        function colorBorders() {
            if (typeof (Page_Validators) !== 'undefined') {

                //loop all the validators
                for (var i = 0; i < Page_Validators.length; i++) {
                    var validator = Page_Validators[i];
                    var control = document.getElementById(validator.controltovalidate);

                    //check if the control actually exists
                    if (control != null) {

                        //if the validator is not valid color the border red, if it is valid return to default color
                        if (!validator.isvalid) {
                            control.style.borderColor = '#ff0000';
                        } else {
                            control.style.borderColor = '#ced4da';
                        }
                    }
                }
            }
        }
    </script>
</asp:Content>
