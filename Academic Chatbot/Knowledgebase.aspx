<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Knowledgebase.aspx.cs" Inherits="Academic_Chatbot.Knowledgebase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pb-3 text-center">
            <asp:Image ID="Knowledgebase_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Images/speech-bubble.png" runat="server" />
            <h2>Chatbot Configuration</h2>
    </div>
    <hr />
    <div class="jumbotron py-4 shadow">
        <div class="mx-5 row justify-content-between">
            <asp:Button ID="NewKB_Button" CssClass="btn btn-primary" Text="New KB" runat="server" />
            <asp:Button ID="TrainPublish_Button" CssClass="btn btn-primary" Text="Train & Publish" runat="server" />
            <asp:Button ID="ChatLog_Button" CssClass="btn btn-primary" Text="Chat Log" OnClick="ChatLog_Button_Click" runat="server" />
        </div>
    </div>
    <hr />

    <!-- Bootstrap Modal Dialog -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title"><asp:Label ID="lblModalTitle" runat="server" Text="Cohort 2016 FYP KB"></asp:Label></h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body mx-auto">
                        <asp:Button Text="Add Entry" CssClass=" btn btn-success" OnClick="Unnamed_Click" runat="server" />
                        <asp:Button Text="Delete Entry" CssClass=" btn btn-danger" OnClick="Unnamed_Click1" runat="server" />
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
</asp:Content>
