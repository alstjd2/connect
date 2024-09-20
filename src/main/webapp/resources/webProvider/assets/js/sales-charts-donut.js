/**
 * Charts ChartsJS
 */
'use strict';

(function () {
	let cardColor, headingColor, labelColor, borderColor, legendColor;

  if (isDarkStyle) {
    cardColor = config.colors_dark.cardColor;
    headingColor = config.colors_dark.headingColor;
    labelColor = config.colors_dark.textMuted;
    legendColor = config.colors_dark.bodyColor;
    borderColor = config.colors_dark.borderColor;
  } else {
    cardColor = config.colors.cardColor;
    headingColor = config.colors.headingColor;
    labelColor = config.colors.textMuted;
    legendColor = config.colors.bodyColor;
    borderColor = config.colors.borderColor;
  }

  // Color constant
  const chartColors = {
    column: {
      series1: '#826af9',
      series2: '#d2b0ff',
      bg: '#f8d3ff'
    },
    donut: {
      series1: '#fee802',
      series2: '#F1F0F2',
      series3: '#826bf8',
      series4: '#3fd0bd'
    },
    area: {
      series1: '#29dac7',
      series2: '#60f2ca',
      series3: '#a5f8cd'
    },
    bar: {
      bg: '#1D9FF2'
    }
  };

  // Heat chart data generator
  function generateDataHeat(count, yrange) {
    let i = 0;
    let series = [];
    while (i < count) {
      let x = 'w' + (i + 1).toString();
      let y = Math.floor(Math.random() * (yrange.max - yrange.min + 1)) + yrange.min;

      series.push({
        x: x,
        y: y
      });
      i++;
    }
    return series;
  }

 // Line Chart
  // --------------------------------------------------------------------
 // Color Variables
   // Donut Chart

//const mProd =`${prod.mProd}`;
//	const yProd =`${prod.yProd}`;
//	const eProd =`${prod.eProd}`;
  // --------------------------------------------------------------------


 const total = Number(mProd)+Number(yProd)+Number(eProd);

function calculatePercentage(part) {
  return Math.round((part / total) * 100);
}

  const donutChartEl = document.querySelector('#donutChart'),
    donutChartConfig = {
      chart: {
        height: 330,
        type: 'donut'
      },
      labels: ['월별건', '년별건', '이벤트'],
//      series: [mProd/total, yProd/total, eProd/total],
      series: [calculatePercentage(mProd), calculatePercentage(yProd), calculatePercentage(eProd)],
      colors: [
        chartColors.donut.series1,
        chartColors.donut.series4,
        chartColors.donut.series3,
        chartColors.donut.series2
      ],
      stroke: {
        show: false,
        curve: 'straight'
      },
      dataLabels: {
        enabled: true,
        formatter: function (val) {
          return val.toFixed(2) + '%';
        }
      },
      legend: {
        show: true,
        position: 'right',
        markers: { offsetX: -3 },
        itemMargin: {
          vertical: 30,
          horizontal: 10
        },
        labels: {
          colors: legendColor,
          useSeriesColors: false
        }

},
      plotOptions: {
        pie: {
          donut: {
            labels: {
              show: true,
              name: {
                fontSize: '2rem',
                fontFamily: 'Public Sans'
              },
              value: {
                fontSize: '1.2rem',
                color: legendColor,
                fontFamily: 'Public Sans',
                formatter: function (val) {
                  return val + '%';
                }
              },
              total: {
                show: true,
                fontSize: '1.5rem',
                color: headingColor,
                label: '월별건',
                formatter: function () {
                  return calculatePercentage(mProd) + '%';
                }
              }
            }
          }
        }
      },
      responsive: [
        {
          breakpoint: 992,
          options: {
            chart: {
              height: 380
            },
            legend: {
              position: 'bottom',
              labels: {
                colors: legendColor,
                useSeriesColors: false
              }
            }
          }
        },
        {
          breakpoint: 576,
          options: {
            chart: {
              height: 320
            },
            plotOptions: {
              pie: {
                donut: {
                  labels: {
                    show: true,
                    name: {
                      fontSize: '1.5rem'
                    },
                    value: {
                      fontSize: '1rem'
                    },
                    total: {
                      fontSize: '1.5rem'
                    }
                  }
                }
              }
            },
            legend: {
              position: 'bottom',
              labels: {
                colors: legendColor,
                useSeriesColors: true
              }
            }
          }
        },
        {
          breakpoint: 420,
          options: {
            chart: {
              height: 280
            },
            legend: {
              show: false
            }
          }
        },
        {
          breakpoint: 360,
          options: {
            chart: {
              height: 250
            },
            legend: {
              show: false
            }
          }
        }
      ]
    };

  if (typeof donutChartEl !== undefined && donutChartEl !== null) {
//    const donutChart = new ApexCharts(donutChartEl, donutChartConfig);
    const donutChart = new ApexCharts(donutChartEl, donutChartConfig);


    donutChart.render();
  }






})();
