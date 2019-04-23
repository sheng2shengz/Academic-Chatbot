<%@Page Title="Login" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="~/Login.aspx.cs" Inherits="Academic_Chatbot.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="text-center">
        <div class="form-signin row justify-content-md-center">
            <asp:Image ID="AcabotLogo_Image" CssClass="mb-4" Height="150" Width="150" ImageUrl="~/Images/templatemo_logo.png" runat="server"/>
            <asp:Label ID="SignIn_Label" CssClass="h3 mb-3 font-weight-normal" Width="100%" runat="server">Sign In</asp:Label>
            <asp:TextBox ID="EmailAddress_TextBox" CssClass="form-control" TextMode="Email" placeholder="Email address" runat="server"></asp:TextBox>
            <asp:TextBox ID="Password_TextBox" CssClass="form-control" TextMode="Password" PlaceHolder="Password" runat="server"></asp:TextBox>
            <asp:Button ID="SignIn_Button" CssClass="mt-3 btn btn-lg btn-primary btn-block shadow" OnClick="SignIn_Button_Click" Text="Sign In" runat="server" />
            <asp:Label CssClass="mt-2 font-weight-light h6" runat="server"><em>*Note: Not compatible with mobile devices yet.</em></asp:Label>
        </div>

        <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <asp:UpdatePanel ID="upModal" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="modal-content">
                            <div class="modal-header ">
                                <h4 class="modal-title mx-auto"><asp:Label ID="lblModalTitle" runat="server" Text="Invalid Login Information!"></asp:Label></h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body text-center mx-auto">
                                <div class="row mb-4">
                                    <asp:Label Text="Invalid username / password!" runat="server"></asp:Label>
                                </div>
                                <asp:Button Text="Retry" CssClass="col-4 btn btn-danger" data-dismiss="modal" runat="server" />
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

</asp:Content>




