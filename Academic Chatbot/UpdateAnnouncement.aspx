<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateAnnouncement.aspx.cs" Inherits="Academic_Chatbot.UpdateAnnouncement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:ImageButton ID="back_ImageButton" CssClass="" Height="40" Width="40" ImageUrl="~/Images/back.png" OnClick="back_ImageButton_Click" CausesValidation="False" runat="server" />
        <div class="py-3 text-center">
            <asp:Image ID="Edit_Image" CssClass="d-block mx-auto mb-4" Width="80" Height="80" ImageUrl="~/Images/Email.png" runat="server" />
            <h2>Update Announcement</h2>
        </div>
        <hr />
        <div class="container mt-4">
        <div id="subject&date" class="container row mx-3">
            <div class="col-9">
                <asp:Label CssClass="row h6" runat="server">Subject</asp:Label>
                <asp:TextBox ID="subject_TextBox" CssClass="row form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-3 container text-center">
                <asp:Label CssClass="h6" runat="server">Send to(Cohort)</asp:Label>
                <asp:DropDownList ID="Cohort_DropDownList" CssClass="form-control btn btn-light" runat="server" DataSourceID="Cohort_SqlDataSource" DataTextField="name" DataValueField="cohort_id"></asp:DropDownList>
            </div>

        </div>
        <div class="container mt-3 mx-3">
            <asp:Label CssClass="h6" runat="server">Content</asp:Label>
            <asp:TextBox ID="body_TextBox" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
        </div> 
            <div class="text-center">
                <asp:Button ID="Update_Button" CssClass="col-4 py-2 btn btn-primary mt-4" Text="Update" OnClick="Submit_Button_Click" runat="server" />
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="Cohort_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:academic_chatbotConnectionString %>" SelectCommand="SELECT * FROM [cohort]"></asp:SqlDataSource>
</asp:Content>
