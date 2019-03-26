<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Mobile.Master" AutoEventWireup="true" CodeBehind="webpage.aspx.cs" Inherits="Academic_Chatbot.webpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="row">
        <div class="col"></div>
        <div class="col">
            <iframe width="400px" height="620px" frameborder="0" scrolling="no" marginheight="300" src="https://assistant-chat-jp-tok.watsonplatform.net/web/public/65abf89a-4d3f-4360-a903-4a33ec68eb57" runat="server"></iframe>
        </div>
        <div class="col"></div>
    </div>

</asp:Content>
