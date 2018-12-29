﻿<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Academic_Chatbot.Dashboard" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="pb-3 text-center">
            <asp:Image ID="Dashboard_Image" CssClass="d-block mx-auto mb-4" Width="100" Height="100" ImageUrl="~/Image/Dashboard.png" runat="server" />
            <h2>Dashboard</h2>
        </div>
        <hr />
        <div class="row">
            <div id="curve_chart" class="col-4"></div>
            <div id="tag_cloud" class="col-4 text-center">
                <h5>hello</h5>
                <h6>hi</h6>
                <h3>FYP</h3>
                <h4>LI</h4>
                <h5>Internship</h5>
                <h2>How</h2>
            </div>
            <div id="piechart" class="col-4"></div>
        </div>
    </div>
    <hr />
    <div class="row align-items-center text-center">
        <asp:Label ID="therearecurrently_Label" CssClass="col-4 align-middle" runat="server">There Are Currently:</asp:Label>
        <div class="col-8">
            <h6><b>5</b> reminders in your inventory.</h6>
            <h6><b>2</b> announcements in your inventory.</h6>
            <h6><b>105</b> total of students in the mailing list.</h6>
            <h6><b>2</b> Cohorts of student.</h6>
            <h6><b>2</b> admins, <b>1</b> FYP Coordinator, <b>1</b> LI Coordinator.</h6>
        </div>
    </div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawLineChart);
      function drawLineChart() {
        var data = google.visualization.arrayToDataTable([
          ['Month', 'User'],
          ['Jan', 43],
          ['Feb', 64],
          ['March', 76],
          ['April', 12],
          ['May', 23],
          ['June', 20],
          ['July', 56],
          ['Aug', 15],
          ['Sept', 33],
          ['Oct', 90],
          ['Nov', 45],
          ['Dec', 100],
        ]);

          var options = {
          title: 'User Traffic',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
    }
</script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     11],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
</asp:Content>