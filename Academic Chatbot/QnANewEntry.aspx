<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="QnANewEntry.aspx.cs" Inherits="Academic_Chatbot.QnANewEntry" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:ImageButton ID="back_ImageButton" Height="40" Width="40" ImageUrl="~/Images/back.png" OnClick="back_ImageButton_Click" runat="server" />
        <div class="pb-3 text-center">
            <asp:Image ID="QnANewEntry_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Images/add.png" runat="server" />
            <h2>New Entry</h2>
        </div>
    </div>
    <hr />
    <div class="">
        <div class="row align-items-center mx-4 mb-2">
            <asp:Label ID="Question_Label" CssClass="col-1" Text="Question:" runat="server"></asp:Label>
            <asp:TextBox ID="Question_TextBox" CssClass="col form-control" runat="server" TextMode="SingleLine"></asp:TextBox>
        </div>
        <div class="row align-items-center mx-4 mb-3">
            <asp:Label ID="Answer_Label" CssClass="col-1" Text="Answer:" runat="server"></asp:Label>
            <asp:TextBox ID="Answer_TextBox" CssClass="col form-control" runat="server" TextMode="Multiline"></asp:TextBox>
        </div>
        <div class="col align-self-end">
        <asp:Button ID="AddEntry_Button" CssClass=" btn btn-success" Text="Add Entry" runat="server" />
        </div>
    </div>
</asp:Content>
