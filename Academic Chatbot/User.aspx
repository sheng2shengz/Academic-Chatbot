<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="Academic_Chatbot.User" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="pb-3 text-center">
            <asp:Image ID="UserManagement_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Images/UserManagement.png" runat="server" />
            <h2>User Management</h2>
        </div>
        <hr />
        <div class="jumbotron shadow row justify-content-md-center mx-3 p-3">
            <div class="col align-self-center col text-center">
                <asp:Button ID="CreateUser_Button" CssClass=" btn btn-light" BorderColor="Black" Text="Add User" OnClick="CreateUser_Button_OnClick" runat="server" />
            </div>
            <div class="col align-self-center mx-3 text-center">
                <h6 class="row justify-content-center">Existing Users:&nbsp;<asp:Label ID="no_of_users" Font-Bold="True" runat="server"></asp:Label></h6>
            </div>
            <div class="col"></div>
        </div>
        <hr />
        <div class="row justify-content-between mx-3 align-items-center">
            <div class="col">
                <asp:Label ID="ListOfUser_Label" CssClass="h5 " Text="List of User" runat="server"></asp:Label>
            </div>
        </div>
        <div class="m-3">
            <asp:SqlDataSource ID="User_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:academic_chatbotConnectionString %>" SelectCommand="SELECT [user].user_id, [user].email_address, role.name, [user].title, [user].first_name, [user].last_name, [user].created_date FROM [user] INNER JOIN role ON [user].role_ID = role.role_id"></asp:SqlDataSource>
            <asp:GridView ID="User_GridView" runat="server" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="True" HeaderStyle-ForeColor="Black" HeaderStyle-CssClass="thead-light" RowStyle-HorizontalAlign="Center" RowStyle-VerticalAlign="Middle" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="User_SqlDataSource" AllowSorting="True" OnRowCommand="UserGridView_RowCommand">
                <Columns>
                    <asp:TemplateField ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:Button ID="edit_button" CommandName="EditCommand" CommandArgument='<%#Eval("user_id") %>' runat="server" Font-Underline="true" Text="Edit" CssClass="btn btn-link p-0"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="user_id" HeaderText="#" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                    <asp:BoundField DataField="email_address" HeaderText="Email" SortExpression="email_address" />
                    <asp:BoundField DataField="name" HeaderText="Role" SortExpression="name" />
                    <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                    <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                    <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                    <asp:BoundField DataField="created_date" HeaderText="Created Date" SortExpression="created_date" />
                    <asp:TemplateField ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:Button ID="delete_button" CommandName="DeleteCommand" CommandArgument='<%#Eval("user_id") %>' OnClientClick="return confirm('Are you sure?')" runat="server" ForeColor="Red" Font-Underline="true" Text="Delete" CssClass="btn btn-link p-0"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

<HeaderStyle HorizontalAlign="Center" Font-Bold="True" ForeColor="Black"></HeaderStyle>
            </asp:GridView>
        </div>

    </div>
</asp:Content>
