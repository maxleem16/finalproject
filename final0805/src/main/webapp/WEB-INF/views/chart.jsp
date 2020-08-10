<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
.columns {margin: auto;} 

</style>
<body>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
       <!--Table and divs that hold the pie charts-->
    <table class="columns">
      <tr>
        <td><div id="piechart_div" style="border: 1px solid #ccc"></div></td>
        <td><div id="barchart_div" style="border: 1px solid #ccc;"></div></td>
      </tr>
    </table>

</body>
<script>
      google.charts.load('current', {
        'packages': ['corechart']
      });
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['보호중인 강아지', 30300],
          ['입양된 강아지', 127036],
          ['반환된 강아지', 55243],
          ['자연사한 강아지', 111192],
          ['안락사된 강아지', 94766],
          ['방사된 강아지', 3660],
          ['기증된 강아지', 7607]
        ]);

        var piechart_options = {
          title: '',
          width: 800,
          height: 600
        };
        var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
        piechart.draw(data, piechart_options);

        var barchart_options = {
          title: '',
          width: 800,
          height: 600,
          legend: 'none'
        };
        var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
        barchart.draw(data, barchart_options);
      } 
</script> 
</html>