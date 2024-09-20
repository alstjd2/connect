/**
 * Charts ChartsJS
 */
'use strict';

(function () {
  // Color Variables
  const purpleColor = '#836AF9',
    yellowColor = '#ffe800',
    cyanColor = '#28dac6',
    orangeColor = '#FF8132',
    orangeLightColor = '#FDAC34',
    oceanBlueColor = '#299AFF',
    greyColor = '#4F5D70',
    greyLightColor = '#EDF1F4',
    blueColor = '#2B9AFF',
    blueLightColor = '#84D0FF',
    blueDarkColor = '#1D9FF2';

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

  // Set height according to their data-height
  // --------------------------------------------------------------------
  const chartList = document.querySelectorAll('.chartjs');
  chartList.forEach(function (chartListItem) {
    chartListItem.height = chartListItem.dataset.height;
  });

  // LineArea Chart
  // --------------------------------------------------------------------

  const lineAreaChart = document.getElementById('lineAreaChart');


if (lineAreaChart) {
    const lineAreaChartVar = new Chart(lineAreaChart, {
      type: 'line',
      data: {
        labels: labels,
        datasets: [
          {
            label: '매출',
            data: data1,
            tension: 0,
            fill: true,
            backgroundColor: orangeLightColor,
            pointStyle: 'circle',
            borderColor: 'transparent',
            pointRadius: 0.5,
            pointHoverRadius: 5,
            pointHoverBorderWidth: 5,
            pointBorderColor: 'transparent',
            pointHoverBackgroundColor: blueColor,
            pointHoverBorderColor: cardColor
          },
          {
            label: '환불',
            data: data2,
            tension: 0,
            fill: true,
            backgroundColor: cyanColor,
            pointStyle: 'circle',
            borderColor: 'transparent',
            pointRadius: 0.5,
            pointHoverRadius: 5,
            pointHoverBorderWidth: 5,
            pointBorderColor: 'transparent',
            pointHoverBackgroundColor: blueColor,
            pointHoverBorderColor: cardColor
          }
        ]
      },

      options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
          legend: {
            position: 'top',
            rtl: isRtl,
            align: 'start',
            labels: {
              usePointStyle: true,
              padding: 35,
              boxWidth: 6,
              boxHeight: 6,
              color: legendColor
            }
          },
          tooltip: {
            // Updated default tooltip UI
            rtl: isRtl,
            backgroundColor: cardColor,
            titleColor: headingColor,
            bodyColor: legendColor,
            borderWidth: 1,
            borderColor: borderColor
          }
        },
        scales: {
          x: {
            grid: {
              color: 'transparent',
              borderColor: borderColor
            },
            ticks: {
              color: labelColor
            }
          },
          y: {
            min: 0,
            max: (data1+data2)/2 + 5000,
            grid: {
              color: 'transparent',
              borderColor: borderColor
            },
            ticks: {
              stepSize: (data1+data2)/2,
              color: labelColor
            }
          }
        }
      }
    });
  }


})();
