<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="NewStudent.aspx.cs" Inherits="Academic_Chatbot.NewStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:ImageButton ID="back_ImageButton" CssClass="" Height="40" Width="40" ImageUrl="~/Images/back.png" OnClick="back_ImageButton_OnClick" CausesValidation="False" runat="server" />
        <div class="py-5 text-center">
            <asp:Image ID="Cap_Image" CssClass="d-block mx-auto mb-4" Width="80" Height="80" ImageUrl="~/Images/cap.png" runat="server" />
            <h2>New Student</h2>
        </div>
        <hr />
        <div class="container text-center mt-4">
            <div class="row">
                <div class="col-6">
                    <div class="row justify-content-center">
                        <asp:Label Text="Student ID" CssClass="h6" runat="server"></asp:Label>
                    </div>
                    <div class="row-11">
                        <asp:TextBox ID="StudentID_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="StudentID_RequiredValidator" ControlToValidate="StudentID_TextBox" ErrorMessage="This field is required" CssClass="mx-auto text-danger" runat="server"></asp:RequiredFieldValidator>
                </div>
                <div class="col-6">
                    <div class="row justify-content-center">
                        <asp:Label Text="Name" CssClass="h6" runat="server"></asp:Label>
                    </div>
                    <div class="row-11">
                        <asp:TextBox ID="Name_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <asp:RequiredFieldValidator ID="Name_RequiredFieldValidator" ControlToValidate="Name_TextBox" ErrorMessage="This field is required" CssClass="mx-auto text-danger" runat="server"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="container mt-4">
                <div class="row justify-content-center">
                    <asp:Label Text="Email Address" CssClass="h6" runat="server"></asp:Label>
                </div>
                <div class="row">
                    <asp:TextBox ID="EmailAddress_TextBox" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="Email_RegExValidator" Display="Dynamic" ControlToValidate="EmailAddress_TextBox" CssClass="mx-auto text-danger" ValidationExpression="^([\w\-\.]+)@((\[([0-9]{1,3}\.){3}[0-9]{1,3}\])|(([\w\-]+\.)+)([a-zA-Z]{2,4}))$" ErrorMessage="Invalid email format" runat="server"></asp:RegularExpressionValidator>
                </div>
                <asp:RequiredFieldValidator ID="Email_RequiredValidator" Display="Dynamic" ControlToValidate="EmailAddress_TextBox" ErrorMessage="This field is required" CssClass="mx-auto text-nowrap text-danger" runat="server"></asp:RequiredFieldValidator>
            </div>
            <div class="row mt-4">
                <div class="col-6">
                    <div class="row justify-content-center">
                        <asp:Label Text="Course" CssClass="h6" runat="server"></asp:Label>
                    </div>
                    <div class="row-11">
                        <asp:DropDownList ID="Course_Dropdownlist" CssClass="btn btn-block btn-light form-control" runat="server">
                            <asp:ListItem Value="HC 05" Text="HC 05"></asp:ListItem>
                            <asp:ListItem Value="HC 00" Text="HC 00"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-6">
                    <div class="row justify-content-center">
                        <asp:Label Text="Cohort" CssClass="h6" runat="server"></asp:Label>
                    </div>
                    <div class="row-11">
                        <asp:DropDownList ID="Cohort_Dropdownlist" CssClass="btn btn-block btn-light form-control" runat="server" DataSourceID="Cohort_SqlDataSource" DataTextField="name" DataValueField="cohort_id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Cohort_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:academic_chatbotConnectionString %>" SelectCommand="SELECT [cohort_id], [name] FROM [cohort] ORDER BY name ASC"></asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <asp:Button ID="Submit_Button" CssClass="col-4 btn btn-primary mt-4" Text="Submit" OnClick="Submit_Button_Click" runat="server" />
        </div>
    </div>

    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header ">
                            <h4 class="modal-title mx-auto"><asp:Label ID="lblModalTitle" runat="server" Text="Student Submitted!"></asp:Label></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body text-center mx-auto">
                            <div class="row mb-4">
                                <asp:Label Text="Student has been saved in the database." runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script type="text/javascript">

        //set the interval for checking the validators
        setInterval(function () { colorBorders() }, 100);

        function colorBorders() {
            if (typeof (Page_Validators) !== 'undefined') {

                //loop all the validators
                for (var i = 0; i < Page_Validators.length; i++) {
                    var validator = Page_Validators[i];
                    var control = document.getElementById(validator.controltovalidate);

                    //check if the control actually exists
                    if (control != null) {

                        //if the validator is not valid color the border red, if it is valid return to default color
                        if (!validator.isvalid) {
                            control.style.borderColor = '#ff0000';
                        } else {
                            control.style.borderColor = '#ced4da';
                        }
                    }
                }
            }
        }
    </script>
</asp:Content>
