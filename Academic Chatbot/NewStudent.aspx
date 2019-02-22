<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="NewStudent.aspx.cs" Inherits="Academic_Chatbot.NewStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:ImageButton ID="back_ImageButton" CssClass="" Height="40" Width="40" ImageUrl="~/Images/back.png" OnClick="back_ImageButton_OnClick" CausesValidation="False" runat="server" />
        <div class="py-5 text-center">
            <asp:Image ID="Cap_Image" CssClass="d-block mx-auto mb-4" Width="80" Height="80" ImageUrl="~/Images/cap.png" runat="server" />
            <h2>New Student</h2>
        </div>
        <hr />
        <div class="container text-center mt-4">
            <div class="row">
                <div class="col-6">
                    <div class="row justify-content-center">
                        <asp:Label Text="Student ID" CssClass="h6" runat="server"></asp:Label>
                    </div>
                    <div class="row-11">
                        <asp:TextBox ID="StudentID_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row justify-content-center">
                        <asp:Label Text="Name" CssClass="h6" runat="server"></asp:Label>
                    </div>
                    <div class="row-11">
                        <asp:TextBox ID="Name_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="container mt-4">
                <div class="row justify-content-center">
                    <asp:Label Text="Email Address" CssClass="h6" runat="server"></asp:Label>
                </div>
                <div class="row">
                    <asp:TextBox ID="EmailAddress_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-6">
                    <div class="row justify-content-center">
                        <asp:Label Text="Course" CssClass="h6" runat="server"></asp:Label>
                    </div>
                    <div class="row-11">
                        <asp:DropDownList CssClass="btn btn-block btn-light" runat="server">
                            <asp:ListItem Text="HC 05"></asp:ListItem>
                            <asp:ListItem Text="HC 00"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row justify-content-center">
                        <asp:Label Text="Cohort" CssClass="h6" runat="server"></asp:Label>
                    </div>
                    <div class="row-11">
                        <asp:DropDownList CssClass="btn btn-block btn-light" runat="server">
                            <asp:ListItem Text="2016"></asp:ListItem>
                            <asp:ListItem Text="2018/2019"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <asp:Button ID="Submit_Button" CssClass="col-4 btn btn-primary mt-4" Text="Submit" runat="server" />
        </div>
    </div>
</asp:Content>
