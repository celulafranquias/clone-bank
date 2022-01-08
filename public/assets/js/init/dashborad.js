"use strict";
$(document).ready(function(){
    
    /* -----  Chartistjs - Widget Bar Chart  ----- */
	function xpChartistjsWidgetBar() {
		new Chartist.Bar('#xp-chartist-widget-bar', {
		  labels: ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom'],

		  series: [
			[5, 4, 3, 7, 5, 10, 3]
		  ]
		}, {
		  axisX: {
			position: 'end',
			showGrid: false
		  },
		  axisY: {
			position: 'start',
			showLabel: false,
			showGrid: false
		  },
		  plugins: [
			Chartist.plugins.tooltip()
		  ]
		}).on('draw', function(data) {
		  if(data.type === 'bar') {
			data.element.attr({
			  style: 'stroke-width: 7px;'
			});
		  }
		});
	}
	xpChartistjsWidgetBar();

    /* -----  Chartistjs - Donut Chart Using Fill Rather Than Stroke  ----- */
	function xpChartistjsDonut() {
		new Chartist.Pie('#xp-chartist-donut-fill-rather-chart', {
		  series: [45, 35, 20]
		}, {
		  donut: true,
		  donutWidth: 30,
		  startAngle: 320,
		  showLabel: false,
		  plugins: [
			  Chartist.plugins.tooltip()
		  ]
		});
	}
	xpChartistjsDonut();
	
    /* -----  Chartistjs - Series Overrides Chart  ----- */
	function xpChartistjsSeriesOverrides() {
      var chart = new Chartist.Line('#xp-chartist-series-overrides', {
        labels: ['Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab', 'Dom', 'Seg'],
        series: [{
          name: 'series',
          data: [3300, 3000, 5000, 3000, 1000, 3000, 6000, 4500]
        }]
      }, {
        fullWidth: true,
        series: {
          'series': {
            lineSmooth: Chartist.Interpolation.simple(),
            showArea: true
          }
        },
        low: 0,
        plugins: [
          Chartist.plugins.tooltip()
        ]
      }, [
        ['screen and (max-width: 320px)', {
          series: {
            'series': {
              lineSmooth: Chartist.Interpolation.none(),
              showArea: false
            }
          }
        }]
      ]);
	}
	xpChartistjsSeriesOverrides();

});