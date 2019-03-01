<%@ Page Title="" Language="C#" MasterPageFile="~/FYP.Master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="Academic_Chatbot.Announcement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

    <div class="pb-3 text-center">
            <asp:Image ID="Announcement_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Images/announcement.png" runat="server" />
            <h2>Announcement Management</h2>
    </div>
    <hr />
    <div class="jumbotron shadow row mx-3 pt-0 pb-2 px-0">
        <asp:Label CssClass="h4 d-block p-2 bg-dark text-white rounded-top col-12" runat="server">New Announcement</asp:Label>
        <div id="type_div" class="container mx-3 mb-3">
                <asp:Label ID="type_Label" CssClass="row" runat="server">Type</asp:Label>
                <asp:DropDownList ID="type_Dropdownlist" CssClass="row form-control" runat="server">
                    <asp:ListItem Value="FYP" Text="FYP"></asp:ListItem>
                    <asp:ListItem Value="LI" Text="LI"></asp:ListItem>
                </asp:DropDownList>
        </div>
        <div id="subject&date" class="container row mx-3">
            <div class="col-9">
                <asp:Label CssClass="row" runat="server">Subject</asp:Label>
                <asp:TextBox ID="subject_TextBox" CssClass="row form-control" runat="server"></asp:TextBox>
            </div>
            <div class="col-3 container">
                <asp:Label CssClass="" runat="server">Send On:</asp:Label>
                <div class="input-group date" data-provide="datepicker" data-date-format="dd/mm/yyyy">
                    <asp:TextBox ID="sendDate_TextBox" runat="server" CssClass="form-control" placeholder="DD/MM/YYYY" ></asp:TextBox>
                    <div class="input-group-addon"></div>
                </div>
            </div>

        </div>
        <div id="body" class="container mt-3 mx-3">
            <asp:Label runat="server">Body</asp:Label>
            <asp:TextBox ID="body_TextBox" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="SaveAnnouncement_Button" CssClass="mx-auto mt-3 btn btn-success" OnClick="SaveAnnouncement_Button_Click" text="Add Announcement" runat="server" />
    </div>
    <hr />
    <div class="container">
        <asp:Label ID="listofannouncement_label" CssClass="h4" runat="server">List of Announcement</asp:Label>
    </div>

    <div class="m-3">
        <asp:GridView ID="announcement_GridView" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True" HeaderStyle-ForeColor="Black" HeaderStyle-CssClass="thead-light" CssClass="table table-striped table-bordered" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="announcement_id" DataSourceID="Announcement_SqlDataSource">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:Button ID="edit_button" CommandName="EditCommand" CommandArgument='<%#Eval("announcement_id") %>' runat="server" Font-Underline="true" Text="Edit" CssClass="btn btn-link p-0"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="FYP/LI" SortExpression="name" />
                <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                <asp:BoundField DataField="body" HeaderText="Body" SortExpression="body" />
                <asp:BoundField DataField="send_date" HeaderText="Send Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="send_date" />
                <asp:TemplateField ItemStyle-CssClass="text-center">
                    <ItemTemplate>
                        <asp:Button ID="delete_button" CommandName="DeleteCommand" CommandArgument='<%#Eval("announcement_id") %>' OnClientClick="return confirm('Are you sure?')" runat="server" ForeColor="Red" Font-Underline="true" Text="Delete" CssClass="btn btn-link p-0"/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="Announcement_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:academic_chatbotConnectionString %>" SelectCommand="SELECT * FROM [announcementView]"></asp:SqlDataSource>
    </div>

    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header ">
                            <h4 class="modal-title mx-auto"><asp:Label ID="lblModalTitle" runat="server" Text="Announcement Saved!"></asp:Label></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body text-center mx-auto">
                            <div class="row mb-4">
                                <asp:Label Text="Announcement has been saved." runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
