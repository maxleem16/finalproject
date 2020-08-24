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

         var data = google.visualization.arrayToDataTable([
         ["Element", "Density", { role: "style" } ],
          ['보호중인 강아지', 30300,"#FFC485"],
          ['입양된 강아지', 127036,"#E94C35"],
          ['반환된 강아지', 55243,"#FF6E50"],
          ['자연사한 강아지', 111192,"#FEA56C"],
          ['안락사된 강아지', 94766,"#3A4933"],
          ['방사된 강아지', 3660,"#BECC75"],
          ['기증된 강아지', 7607,"#EBF9D6"]
        ]);

         var view = new google.visualization.DataView(data);
          view.setColumns([0, 1,
                           { calc: "stringify",
                             sourceColumn: 1,
                             type: "string",
                             role: "annotation" },
                           2]);
         
        var piechart_options = {
          title: '',
          width: 800,
          height: 600,
          slices: {
              0: { color: '#FFC485' },
              1: { color: '#E94C35' },
              2: { color: '#FF6E50' },
              3: { color: '#FEA56C' },
              4: { color: '#3A4933' },
              5: { color: '#BECC75' },
              6: { color: '#EBF9D6' }
            }
        };
        var piechart = new google.visualization.PieChart(document.getElementById('piechart_div'));
        piechart.draw(view, piechart_options);

        var barchart_options = {
          title: '',
          width: 800,
          height: 600,
          legend: 'none',
        };
        var barchart = new google.visualization.BarChart(document.getElementById('barchart_div'));
        barchart.draw(view, barchart_options);
      } 
</script> 
</html>