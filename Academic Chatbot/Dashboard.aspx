<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/LI.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Academic_Chatbot.Dashboard" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="pb-3 text-center">
            <asp:Image ID="Dashboard_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Images/Dashboard.png" runat="server" />
            <h2>Dashboard</h2>
        </div>
        <hr />
        <div class="row" style="height: 200px">
            <div id="lipiechart" class="col-4 border-bottom"></div>
            <div class="col-4 row align-items-center text-center">
                <asp:Label ID="C2016" runat="server" Visible="True">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C2016date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>    
                <asp:Label ID="C20182019" runat="server" Visible="False">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C20182019date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>            
                <asp:Label ID="C2017" runat="server" Visible="False">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C2017date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>  
                <asp:Label ID="C2018" runat="server" Visible="False">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C2018date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>  
                <asp:Label ID="C2019" runat="server" Visible="False">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C2019date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>  
                <asp:Label ID="C2020" runat="server" Visible="False">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C2020date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>  
                <asp:Label ID="C2021" runat="server" Visible="False">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C2021date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>  
                <asp:Label ID="C2022" runat="server" Visible="False">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C2022date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>  
                <asp:Label ID="C2023" runat="server" Visible="False">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C2023date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>  
                <asp:Label ID="C2024" runat="server" Visible="False">
                    <asp:Label runat="server" Font-Bold="true">Cohort 2016</asp:Label>&nbsp;has been updated at&nbsp;<asp:Label ID="C2024date" runat="server" Font-Bold="true"><%: DateTime.Now.Date.Day %>/<%: DateTime.Now.Date.Month %>/<%: DateTime.Now.Date.Year %></asp:Label>.
                </asp:Label>  
            </div>
            <div id="fyppiechart" class="col-4 border-bottom"></div>
        </div>
    </div>
    <br />
    <div class="row align-items-center text-center">
        <asp:Label ID="therearecurrently_Label" CssClass="col-4 align-middle" runat="server">There Are Currently:</asp:Label>
        <div class="col-8">
            <asp:Label CssClass="h6" runat="server"><asp:Label ID="NoOfAnnouncement_Label" Font-Bold="True" runat="server"></asp:Label>&nbsp;announcement(s) saved in your inventory.</asp:Label>
            <br /><br />
            <asp:Label CssClass="h6" runat="server"><asp:Label ID="NoOfStudent_Label" Font-Bold="True" runat="server"></asp:Label>&nbsp;total of student(s) in the mailing list.</asp:Label>
            <br /><br />
            <asp:Label CssClass="h6" runat="server"><asp:Label ID="NoOfCohort_Label" Font-Bold="True" runat="server"></asp:Label>&nbsp;Cohort(s) of student(s).</asp:Label>
            <br /><br />
            <asp:Label ID="NoOfUser_Label" CssClass="h6" runat="server"><asp:Label ID="NoOfAdmin_Label" Font-Bold="True" runat="server"></asp:Label>&nbsp;admin(s),&nbsp;<asp:Label ID="NoOfFYPCoordinator_Label" Font-Bold="True" runat="server"></asp:Label>&nbsp;FYP Coordinator(s),&nbsp;<asp:Label ID="NoOfLICoordinator_Label" Font-Bold="True" runat="server"></asp:Label>&nbsp;LI Coordinator(s).</asp:Label>
        </div>
    </div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawFYPChart);
      google.charts.setOnLoadCallback(drawLIChart);
      function drawFYPChart() {

        var data = google.visualization.arrayToDataTable([
          ['Status', 'No.'],
          ['Sent',     11],
          ['Saved',      2],
        ]);

        var options = {
          title: 'FYP Announcement'
        };

        var chart = new google.visualization.PieChart(document.getElementById('fyppiechart'));

        chart.draw(data, options);
    }
      function drawLIChart() {

            var data = google.visualization.arrayToDataTable([
              ['Status', 'No.'],
              ['Sent',     5],
              ['Saved',      8],
            ]);

            var options = {
              title: 'LI Announcement'
            };

            var chart = new google.visualization.PieChart(document.getElementById('lipiechart'));

            chart.draw(data, options);
          }
    </script>
</asp:Content>
