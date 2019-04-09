<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Knowledgebase.aspx.cs" Inherits="Academic_Chatbot.Knowledgebase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pb-3 text-center">
            <asp:Image ID="Knowledgebase_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Images/speech-bubble.png" runat="server" />
            <h2>Chatbot Configuration</h2>
    </div>
    <hr />
    <div class="row align-items-center justify-content-center mt-4">
        <asp:Label CssClass="text-center font-weight-bold h4" runat="server">COHORT:&nbsp;</asp:Label>
        <asp:DropDownList CssClass="form-control col-2" runat="server">
            <asp:ListItem Value="2016">2016</asp:ListItem>
            <asp:ListItem Value="20182019">2018/2019</asp:ListItem>
            <asp:ListItem Value="2017">2017</asp:ListItem>
            <asp:ListItem Value="2018">2018</asp:ListItem>
            <asp:ListItem Value="2019">2019</asp:ListItem>
            <asp:ListItem Value="2020">2020</asp:ListItem>
            <asp:ListItem Value="2021">2021</asp:ListItem>
            <asp:ListItem Value="2022">2022</asp:ListItem>
            <asp:ListItem Value="2023">2023</asp:ListItem>
            <asp:ListItem Value="2024">2024</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="row align-items-center justify-content-center">
        <asp:Label runat="server">Last Updated:</asp:Label><asp:Label ID="lastUpdateDate_Label" runat="server"></asp:Label>
    </div>
    <div class="row">
        <div class="col">
            <div class="jumbotron shadow pt-2 text-center pb-2 mx-2">
                <div style="display: table-cell">
                    <h5 class="mt-0 font-weight-bold">FYP</h5>
                    <h6 class="font-weight-light font-italic">Note: Update the <b>FYP</b> timeline pdf/image for the selected cohort here.</h6>
                    <br />
                    <asp:FileUpload CssClass="row" runat="server" />
                    <br />
                    <asp:Button class="align-content-bottom btn btn-info" Text="Update" runat="server" />
                </div>
            </div>
        </div>
        <div class="col">
            <div class="jumbotron shadow pt-2 text-center pb-2 mx-2">
                <div style="display: table-cell">
                    <h5 class="mt-0 font-weight-bold">LI</h5>
                    <h6 class="font-weight-light font-italic">Note: Update the <b>LI</b> timeline pdf/image for the selected cohort here.</h6>
                    <br />
                    <asp:FileUpload CssClass="row" runat="server" />
                    <br />
                    <asp:Button class="align-content-bottom btn btn-info" Text="Update" runat="server" />
                </div>
            </div>
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
