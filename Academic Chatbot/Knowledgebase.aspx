<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Knowledgebase.aspx.cs" Inherits="Academic_Chatbot.Knowledgebase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pb-3 text-center">
            <asp:Image ID="Knowledgebase_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Images/speech-bubble.png" runat="server" />
            <h2>Chatbot Configuration</h2>
    </div>
    <hr />
    <div class="row align-items-center justify-content-center mt-4">
        <asp:Label CssClass="text-center font-weight-bold h4" runat="server">COHORT:&nbsp;</asp:Label>
        <asp:DropDownList ID="cohort_dropdownlist" CssClass="form-control col-2" runat="server">
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
<%--    <div id="fyp_lastupdated" class="row align-items-center justify-content-center" runat="server">
        <asp:Label runat="server">Last Updated(FYP):</asp:Label><asp:Label ID="FYPlastUpdateDate_Label" runat="server"></asp:Label>
    </div>
    <div id="li_lastupdated" class="row align-items-center justify-content-center" runat="server">
        <asp:Label runat="server">Last Updated(LI):</asp:Label><asp:Label ID="LIlastUpdateDate_Label" runat="server"></asp:Label>
    </div>--%>
    <div class="row">
        <div id="left_div" class="col-3" runat="server"></div>
        <div class="col" id="FYP_div" runat="server">
            <div class="jumbotron shadow pt-2 text-center pb-2 mx-2">
                <div style="display: table-cell">
                    <h5 class="mt-0 font-weight-bold">FYP</h5>
                    <h6 class="font-weight-light font-italic">Note: Update the <b>FYP</b> timeline pdf file for the selected cohort here.</h6>
                    <br />
                    <asp:FileUpload ID="FYP_FileUpload" CssClass="row" runat="server" />
                    <br />
                    <asp:Button ID="UpdateFYP_Button" class="align-content-bottom btn btn-info" Text="Update" OnClick="UpdateFYP_Button_Click" runat="server" />
                    <div class="row-12 text-center">
                        <asp:RegularExpressionValidator ID="FYP_FileUpload_RegularExpressionValidator" ForeColor="Red" runat="server" ControlToValidate="FYP_FileUpload" ValidationExpression="^([a-zA-Z].*|[1-9].*)\.(((p|P)(d|D)(f|F)))$">PDF file required</asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
        </div>
        <div class="col" id="LI_div" runat="server">
            <div class="jumbotron shadow pt-2 text-center pb-2 mx-2">
                <div style="display: table-cell">
                    <h5 class="mt-0 font-weight-bold">LI</h5>
                    <h6 class="font-weight-light font-italic">Note: Update the <b>LI</b> timeline pdf file for the selected cohort here.</h6>
                    <br />
                    <asp:FileUpload ID="LI_FileUpload" AllowMultiple="false" CssClass="row" runat="server" />
                    <br />
                    <asp:Button ID="UpdateLI_Button" class="align-content-bottom btn btn-info" Text="Update" OnClick="UpdateLI_Button_Click" runat="server" />
                    <div class="row-12 text-center">
                        <asp:RegularExpressionValidator ID="LI_FileUpload_ReGexValidator" ForeColor="Red" runat="server" ControlToValidate="LI_FileUpload" ValidationExpression="^([a-zA-Z].*|[1-9].*)\.(((p|P)(d|D)(f|F)))$">PDF file required</asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>
        </div>
        <div id="right_div" class="col-3" runat="server"></div>
    </div>
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header ">
                            <h4 class="modal-title mx-auto"><asp:Label ID="lblModalTitle" runat="server" Text="File Updated!"></asp:Label></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body text-center mx-auto">
                            <div class="row mb-4">
                                <asp:Label Text="File has been successfully uploaded & chatbot has been updated." runat="server"></asp:Label>
                            </div>
                            <asp:Button ID="continue_button" Text="Continue" CssClass="col-4 btn btn-light" BorderColor="Black" OnClick="continue_button_Click" runat="server" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <div class="modal fade" id="myModal1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header ">
                            <h4 class="modal-title mx-auto"><asp:Label ID="Label1" runat="server" Text="No file found!"></asp:Label></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body text-center mx-auto">
                            <div class="row mb-4">
                                <asp:Label Text="No file found." runat="server"></asp:Label>
                            </div>
                            <asp:Button ID="Button1" Text="Continue" CssClass="btn btn-light" BorderColor="Black" OnClick="continue_button_Click" runat="server" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
