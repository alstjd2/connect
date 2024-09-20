/**
 *
 */
document.addEventListener('DOMContentLoaded', function() {
	// Color Variables
	const purpleColor = '#836AF9',
		yellowColor = '#ffe800',
		cyanColor = '#28dac6',
		orangeColor = '#FF8132',
		orangeLightColor = '#FDAC34',
		oceanBlueColor = '#b4df7b',
		greyColor = '#f8719c',
		greyLightColor = '#fea4a4',
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
	chartList.forEach(function(chartListItem) {
		chartListItem.height = chartListItem.dataset.height;
	});


	// Doughnut Chart
  // --------------------------------------------------------------------

  const doughnutChart = document.getElementById('doughnutChart');
  if (doughnutChart) {
    const doughnutChartVar = new Chart(doughnutChart, {
      type: 'doughnut',
      data: {
        labels: labels,
        datasets: [
          {
            data: data1,
				backgroundColor: [
					purpleColor
					, greyLightColor
					, blueDarkColor
					, yellowColor
					, cyanColor
					, orangeLightColor
					, oceanBlueColor
					, greyColor
					, blueColor
					, orangeColor
					, blueLightColor
					 ],
            borderWidth: 0,
            pointStyle: 'rectRounded'
          }
        ]
      },
      options: {
        responsive: true,
        animation: {
          duration: 500
        },
        cutout: '40%',
        plugins: {
          legend: {
            display: false
          },
          tooltip: {
            callbacks: {
              label: function (context) {
                const label = context.labels || '',
                  value = context.parsed;
                const output = ' ' + label + ' : ' + value + ' %';
                return output;
              }
            },
            // Updated default tooltip UI
            rtl: isRtl,
            backgroundColor: cardColor,
            titleColor: headingColor,
            bodyColor: legendColor,
            borderWidth: 1,
            borderColor: borderColor
          }
        }
      }
    });
  }


});

