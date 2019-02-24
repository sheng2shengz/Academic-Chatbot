<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Academic_Chatbot.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class=" text-center">
            <asp:Image ID="Student_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Images/student.png" runat="server" />
            <h2>Student List</h2>
        </div>
        <hr />
        <div class="jumbotron shadow row justify-content-md-center mx-3 p-3">
            <div class="col align-self-center row justify-content-center ">
                <asp:Button ID="AddStudent_Button" CssClass=" btn btn-light" BorderColor="Black" Text="Add Student" OnClick="AddStudent_Button_Click" runat="server" />
            </div>
            <div class="col align-self-center">
                <asp:Label CssClass="row justify-content-center" runat="server">Total Students:&nbsp;<asp:Label ID="No_Of_Student" Font-Bold="True" runat="server"></asp:Label></asp:Label>
                <asp:Label CssClass="row justify-content-center" Text="Number of Cohorts: <b>2</b>" runat="server"></asp:Label>
            </div>
            <div class="col  align-self-center">
                <div class="row justify-content-center mb-2">
                <asp:Button ID="AddCohort_Button" CssClass=" btn btn-light" BorderColor="Black" Text="Add Cohort" OnClick="AddCohort_Button_Click" runat="server" />
                </div>
                <div class="row justify-content-center">
                <asp:Button ID="DeleteCohort_Button" CssClass=" btn btn-light" BorderColor="Black" Text="Delete Cohort" OnClick="DeleteCohort_Button_Click" runat="server" />
                </div>
            </div>
        </div>
        <hr />
        <div class="row justify-content-between mx-3 align-items-center">
            <div class="col">
                <asp:Label ID="ListOfStudent_Label" CssClass="h5 " Text="List of Student" runat="server"></asp:Label>
            </div>
            <div class="col-auto">
                <asp:Label ID="Cohort_Label" Text="Cohort:" runat="server"></asp:Label>
                <asp:DropDownList CssClass="btn btn-sm btn-light border border-dark" runat="server">
                    <asp:ListItem Text="2016"></asp:ListItem>
                    <asp:ListItem Text="2018/2019"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="m-3">
            <asp:GridView ID="Student_GridView" runat="server" CssClass="table table-striped table-bordered" HeaderStyle-CssClass="thead-light" HeaderStyle-HorizontalAlign="Center" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="Black" OnRowCommand="Student_GridView_RowCommand" AllowSorting="True" AutoGenerateColumns="False" ShowHeaderWhenEmpty="true" DataKeyNames="student_id" DataSourceID="Student_SqlDataSource">
                <Columns>
                    <asp:TemplateField ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:Button ID="edit_button" CommandName="EditCommand" CommandArgument='<%#Eval("student_id") %>' runat="server" Font-Underline="true" Text="Edit" CssClass="btn btn-link p-0"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="student_id" HeaderText="Matric No." ReadOnly="True" SortExpression="student_id" />
                    <asp:BoundField DataField="cohort" HeaderText="Cohort" SortExpression="cohort" />
                    <asp:BoundField DataField="email_address" HeaderText="Email Address" SortExpression="email_address" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:BoundField DataField="course" HeaderText="Course" SortExpression="course" />
                    <asp:TemplateField ItemStyle-CssClass="text-center">
                        <ItemTemplate>
                            <asp:Button ID="delete_button" CommandName="DeleteCommand" CommandArgument='<%#Eval("student_id") %>' OnClientClick="return confirm('Are you sure?')" runat="server" ForeColor="Red" Font-Underline="true" Text="Delete" CssClass="btn btn-link p-0"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="Student_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:academic_chatbotConnectionString %>" SelectCommand="SELECT * FROM [studentView]"></asp:SqlDataSource>
        </div>
    </div>

    <!-- Bootstrap Modal Dialog -->
    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header ">
                            <h4 class="modal-title mx-auto"><asp:Label ID="lblModalTitle" runat="server" Text="Add Cohort?"></asp:Label></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body text-center mx-auto">
                            <div class="row mb-4">
                                <asp:Label Text="Cohort Name:" runat="server"></asp:Label>
                                <asp:TextBox CssClass="form-control col-auto" runat="server"></asp:TextBox>
                            </div>
                            <asp:Button Text="Add" CssClass="col-4 btn btn-light" BorderColor="Black" runat="server" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

        <div class="modal fade" id="myModal2" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header text-center">
                            <h4 class="modal-title mx-auto"><asp:Label ID="Label1" runat="server" Text="Delete Cohort?"></asp:Label></h4>
                            <button type="button" class="close" data-dismiss="modal2" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body text-center mx-auto">
                            <asp:Label Font-Bold="true" runat="server">Note: Deleting cohort will also delete the students of that cohort!</asp:Label>
                            <div class="row justify-content-center my-4">
                                <asp:Label Text="Cohort Name:" CssClass="col-auto align-self-center" runat="server"></asp:Label>
                                <asp:DropDownList CssClass="btn btn-danger" runat="server">
                                    <asp:ListItem Text="2016"></asp:ListItem>
                                    <asp:ListItem Text="2018/2019"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <asp:Button Text="Delete" CssClass="btn btn-danger" runat="server" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>
