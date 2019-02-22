<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Reminder.aspx.cs" Inherits="Academic_Chatbot.Reminder" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pb-3 text-center">
            <asp:Image ID="Reminder_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Image/reminder.png" runat="server" />
            <h2>Reminder Management</h2>
    </div>
    <hr />
    <div class="jumbotron shadow row mx-3 pt-0 pb-2 px-0">
        <asp:Label CssClass="h4 d-block p-2 bg-dark text-white rounded-top col-12" runat="server">New Reminder</asp:Label>
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
        <asp:Button CssClass="mx-auto mt-3 btn btn-success" text="Add Reminder" runat="server" />
    </div>
    <hr />
    <div class="container">
        <asp:Label ID="listofreminder_label" CssClass="h4" runat="server">List of Reminder</asp:Label>
    </div>

    <div class="m-3">
            <table class="table table-striped">
              <thead>
                <tr>
                    <th>ID</th>
                    <th>Email Address</th>
                    <th>Name</th>
                    <th>Course</th>
                    <th></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                    <td>BI15110234</td>
                    <td>asdfasba@gmail.com</td>
                    <td>Ipsum Dolor</td>
                    <td>HC 05</td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>BI15113561</td>
                    <td>iuogndg@gmail.com</td>
                    <td>Consectetur adipiscing</td>
                    <td>HC 00</td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>BI15120122</td>
                    <td>ppedmx@gmail.com</td>
                    <td>Necodio</td>
                    <td>HC 05</td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>BI15111234</td>
                    <td>123ghis@gmail.com</td>
                    <td>Sed Cursus</td>
                    <td>HC 05</td>
                    <td>
                    </td>
                </tr>
              </tbody>
            </table>
        </div>
</asp:Content>
