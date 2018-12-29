<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Knowledgebase.aspx.cs" Inherits="Academic_Chatbot.Knowledgebase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pb-3 text-center">
            <asp:Image ID="Knowledgebase_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Image/book.png" runat="server" />
            <h2>Knowledgebase Management</h2>
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
    <div class="container">
        <div class="row justify-content-between">
            <asp:Label ID="ListOfKnowledgebase_Label" CssClass="h4" Text="List of Knowledgebase" runat="server"></asp:Label>
            <asp:Button ID="Download_Button" CssClass="btn btn-primary" Text="Download" runat="server" />
        </div>
        <div class="mt-3">
            <table class="table text-center">
                <thead class="thead-light">
                    <tr>
                        <th>#</th>
                        <th>KB</th>
                        <th>Last Edited On</th>
                        <th>Created Date</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>1</th>
                        <td>Cohort 2016 FYP KB</td>
                        <td>5/5/2018</td>
                        <td>2/2/2018</td>
                        <td>
                            <asp:LinkButton ID="Edit_LinkButton" Text="Edit" CssClass="mr-1" Font-Underline="true" OnClick="Edit_LinkButton_Click" runat="server"></asp:LinkButton>
                            <asp:LinkButton ID="Delete_LinkButton" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>Cohort 2016 LI KB</td>
                        <td>5/6/2018</td>
                        <td>3/3/2018</td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" Text="Edit" CssClass="mr-1" Font-Underline="true" runat="server"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>Cohort 2015 FYP KB</td>
                        <td>23/5/2018</td>
                        <td>5/3/2018</td>
                        <td>
                            <asp:LinkButton ID="LinkButton3" Text="Edit" CssClass="mr-1" Font-Underline="true" runat="server"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton4" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

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
                        <asp:Button Text="Add Entry" CssClass=" btn btn-success" runat="server" />
                        <asp:Button Text="Delete Entry" CssClass=" btn btn-danger" runat="server" />
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
