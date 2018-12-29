<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ChatLog.aspx.cs" Inherits="Academic_Chatbot.ChatLog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:ImageButton ID="back_ImageButton" Height="40" Width="40" ImageUrl="~/Image/back.png" CausesValidation="False" runat="server" />
        <div class="pb-3 text-center">
            <asp:Image ID="ChatLog_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Image/service.png" runat="server" />
            <h2>Chat Log</h2>
        </div>
    </div>

    <hr />
    <div class="mt-3">
            <table class="table table-striped text-center" border="1">
                <thead class="thead-dark">
                    <tr class="h5">
                        <th>#</th>
                        <th>Timestamp</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>1</th>
                        <td>12/12/2018 2:30PM</td>
                        <td>
                            <asp:LinkButton ID="View_LinkButton" Text="View" Font-Underline="true" runat="server"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>23/02/2019 5:00PM</td>
                        <td>
                            <asp:LinkButton ID="LinkButton1" Text="View" Font-Underline="true" runat="server"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>5/3/2019 8:00AM</td>
                        <td>
                            <asp:LinkButton ID="LinkButton2" Text="View" Font-Underline="true" runat="server"></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <th>4</th>
                        <td>10/3/2019 10:00AM</td>
                        <td>
                            <asp:LinkButton ID="LinkButton3" Text="View" Font-Underline="true" runat="server"></asp:LinkButton>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
</asp:Content>
