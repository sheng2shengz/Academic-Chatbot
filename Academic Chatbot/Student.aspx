<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Academic_Chatbot.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class=" text-center">
            <asp:Image ID="Student_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Image/student.png" runat="server" />
            <h2>Student List</h2>
        </div>
        <hr />
        <div class="jumbotron shadow row justify-content-md-center mx-3 p-3">
            <div class="col align-self-center row justify-content-center ">
                <asp:Button ID="AddStudent_Button" CssClass=" btn btn-light" BorderColor="Black" Text="Add Student" runat="server" />
            </div>
            <div class="col align-self-center">
                <asp:Label CssClass="row justify-content-center" Text="Total Students:<b>45</b>" runat="server"></asp:Label>
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
                        <asp:LinkButton ID="Edit_LinkButton" Text="Edit" CssClass="mr-1" Font-Underline="true" runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="Delete_LinkButton" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>BI15113561</td>
                    <td>iuogndg@gmail.com</td>
                    <td>Consectetur adipiscing</td>
                    <td>HC 00</td>
                    <td>
                        <asp:LinkButton ID="LinkButton1" Text="Edit" CssClass="mr-1" Font-Underline="true" runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton2" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>BI15120122</td>
                    <td>ppedmx@gmail.com</td>
                    <td>Necodio</td>
                    <td>HC 05</td>
                    <td>
                        <asp:LinkButton ID="LinkButton3" Text="Edit" CssClass="mr-1" Font-Underline="true" runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton4" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>BI15111234</td>
                    <td>123ghis@gmail.com</td>
                    <td>Sed Cursus</td>
                    <td>HC 05</td>
                    <td>
                        <asp:LinkButton ID="LinkButton5" Text="Edit" CssClass="mr-1" Font-Underline="true" runat="server"></asp:LinkButton>
                        <asp:LinkButton ID="LinkButton6" Text="Delete" Font-Underline="true" runat="server"></asp:LinkButton>
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
