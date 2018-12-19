<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="Academic_Chatbot.Announcement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pb-3 text-center">
            <asp:Image ID="Announcement_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Image/announcement.png" runat="server" />
            <h2>Announcement Management</h2>
    </div>
    <hr />
    <div class="jumbotron shadow row mx-3 pt-0 pb-2 px-0">
        <asp:Label CssClass="h4 d-block p-2 bg-dark text-white rounded-top col-12" runat="server">New Announcement</asp:Label>
        <div id="subject&date" class="container row mx-3">
            <div class="col-8">
                <asp:Label CssClass="row" runat="server">Subject</asp:Label>
                <asp:TextBox CssClass="row form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-4 container ">
                <asp:Label CssClass="" runat="server">Send On:</asp:Label>
                <asp:TextBox CssClass=" form-control" runat="server"></asp:TextBox>
            </div>
        </div>
        <div id="body" class="container mt-3 mx-3">
            <asp:Label runat="server">Body</asp:Label>
            <asp:TextBox ID="body_textbox" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
        </div>
        <asp:Button CssClass="mx-auto mt-3 btn btn-success" text="Add Announcement" runat="server" />
    </div>
    <hr />
    <div class="container">
        <asp:Label ID="listofannouncement_label" CssClass="h4" runat="server">List of Announcement</asp:Label>
    </div>
</asp:Content>
