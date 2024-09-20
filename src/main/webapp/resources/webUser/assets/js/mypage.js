
//(function() {

const refn = document.querySelector(".refnBtn");
const ok = document.querySelector(".okBtn");
const refnModal = document.querySelector("#refnModal");
//const refnBody = document.querySelector("#refnTBody");

//환불 버튼 클릭시
refn.addEventListener("click", function() {
		buyList();
});

ok.addEventListener("click", function() {
	var checkArr = [];
	var len = $("input[name='buy']:checked").length;
	if (len > 1) { //개수를 체크하고 2개부터는 each함수를 통해 각각 가져온다.
		$("input[name='buy']:checked").each(function(e) {
//			console.log($(this).val())
			checkArr.push($(this).val());
		})
	}
	console.log("checkArr");
	console.log(checkArr);
	const data = {
		  method: 'POST',
		  headers: {
		    'Content-Type': 'application/json'
		  },
		  body: JSON.stringify(checkArr)
	};
	refnList(data);
});


//선택한거 환불 진행
const refnList = (data) => FetchUtils.fetchForJSON("/connect/w/refn/refnList", data)
	.then((resp) => {
		console.log("//선택한거 환불 진행");
		console.log("resp",resp);

		Swal.fire({
			title: '환불 사유 선택',
			input: 'select',
			inputOptions: {
				AA01150: '단순변심',
				AA01110: '상품불만족',
				AA01120: '비용불만족',
				AA01130: '서비스불만족',
				AA01140: '잦은에러',
				AA01160: '기타'
			},
			inputPlaceholder: '사유를 선택해주세요.',
			showCancelButton: false,
			inputValidator: (value) => {
				return new Promise((resolve) => {
					if (value == '') {
						resolve('사유를 선택하지 않았습니다.')
					} else {
						console.log("이게 머얌",value);
						location.href="/w/";
					}
				})

			}
		})

		if (fruit) {
			Swal.fire('You selected: ' + fruit)
		}

	})();



//구매 리스트 목록 조회
const buyList = () => FetchUtils.fetchForJSON("/connect/w/refn/buyList")
		.then((resp) => {
			let html = '';
			const data =resp;


			var cnt = 0;
			data.forEach(element => {//foreach 배열의 개수만큼 반복문을 돌려라
				cnt++;
					console.log(element)//element에는 하나 하나의 배열이 담아져 있음
				html += `
							<tr>
								<td class="  dt-checkboxes-cell"><input name='buy' type="checkbox" value="${element.buyNo}" class="dt-checkboxes form-check-input"></td>
								<td><i class="fab fa-angular fa-xl text-danger me-4"></i>
								<span>${cnt}</span></td>
								<td>${element.buyDate}</td>
								<td>${element.buyUseStartDate }</td>
								<td>${element.buyUseEndDate  }</td>
							</tr>
				`

			});
			$('#refnTBody').html(html)//화면에 출력
		});



/*
	class EasyPieChart {
		constructor(el, options) {
			this.el = el;
			this.options = Object.assign({}, EasyPieChart.defaultOptions, options);
			this.percentage = 0;
			this.canvas = document.createElement('canvas');
			this.canvas.width = this.options.size;
			this.canvas.height = this.options.size;
			this.el.appendChild(this.canvas);
			this.ctx = this.canvas.getContext('2d');
			if (window.devicePixelRatio > 1.5) {
				this.canvas.style.width = `${this.options.size}px`;
				this.canvas.style.height = `${this.options.size}px`;
				this.canvas.width *= 2;
				this.canvas.height *= 2;
				this.ctx.scale(2, 2);
			}
			this.ctx.translate(this.options.size / 2, this.options.size / 2);
			this.el.classList.add('easyPieChart');
			this.el.style.width = `${this.options.size}px`;
			this.el.style.height = `${this.options.size}px`;
			this.el.style.lineHeight = `${this.options.size}px`;
			let percent = parseInt(this.el.getAttribute('data-percent'), 10);
			this.update(percent);
		}

		update(percent) {
			if (this.options.animate === false) {
				this.drawLine(percent);
			} else {
				this.animateLine(this.percentage, percent);
			}
		}

		renderScale() {
			this.ctx.fillStyle = this.options.scaleColor;
			this.ctx.lineWidth = 1;
			for (let i = 0; i <= 24; i++) {
				this.addScaleLine(i);
			}
		}

		addScaleLine(i) {
			let offset = i % 6 === 0 ? 0 : this.options.size * 0.017;
			this.ctx.save();
			this.ctx.rotate(i * Math.PI / 12);
			this.ctx.fillRect(this.options.size / 2 - offset, 0, -this.options.size * 0.05 + offset, 1);
			this.ctx.restore();
		}

		renderTrack() {
			let offset = this.options.size / 2 - this.options.lineWidth / 2;
			if (this.options.scaleColor !== false) {
				offset -= this.options.size * 0.08;
			}
			this.ctx.beginPath();
			this.ctx.arc(0, 0, offset, 0, Math.PI * 2, true);
			this.ctx.closePath();
			this.ctx.strokeStyle = this.options.trackColor;
			this.ctx.lineWidth = this.options.lineWidth;
			this.ctx.stroke();
		}

		renderBackground() {
			if (this.options.scaleColor !== false) {
				this.renderScale();
			}
			if (this.options.trackColor !== false) {
				this.renderTrack();
			}
		}

		drawLine(percent) {
			this.renderBackground();
			this.ctx.strokeStyle = (typeof this.options.barColor === 'function') ? this.options.barColor(percent) : this.options.barColor;
			this.ctx.lineCap = this.options.lineCap;
			this.ctx.lineWidth = this.options.lineWidth;
			let offset = this.options.size / 2 - this.options.lineWidth / 2;
			if (this.options.scaleColor !== false) {
				offset -= this.options.size * 0.08;
			}
			this.ctx.save();
			this.ctx.rotate(-Math.PI / 2);
			this.ctx.beginPath();
			this.ctx.arc(0, 0, offset, 0, Math.PI * 2 * percent / 100, false);
			this.ctx.stroke();
			this.ctx.restore();
		}

		animateLine(from, to) {
			let currentStep = 0;
			let fps = 30;
			let steps = fps * this.options.animate / 1000;
			this.options.onStart.call(this);
			this.percentage = to;
			if (this.animation) {
				clearInterval(this.animation);
				this.animation = false;
			}
			this.animation = setInterval(() => {
				this.ctx.clearRect(-this.options.size / 2, -this.options.size / 2, this.options.size, this.options.size);
				this.renderBackground();
				this.drawLine(this.easeInOutQuad(currentStep, from, to - from, steps));
				currentStep++;
				if ((currentStep / steps) > 1) {
					clearInterval(this.animation);
					this.animation = false;
					this.options.onStop.call(this);
				}
			}, 1000 / fps);
		}

		easeInOutQuad(t, b, c, d) {
			let easeIn = (t) => Math.pow(t, 2);
			let easing = (t) => t < 1 ? easeIn(t) : 2 - easeIn((t / 2) * -2 + 2);
			t /= d / 2;
			return c / 2 * easing(t) + b;
		}
	}

	EasyPieChart.defaultOptions = {
		barColor: '#ef1e25',
		trackColor: '#f2f2f2',
		scaleColor: '#dfe0e0',
		lineCap: 'round',
		size: 110,
		lineWidth: 3,
		animate: false,
		onStart: function() {},
		onStop: function() {}
	};

	document.querySelectorAll('.chart').forEach((el) => {
		new EasyPieChart(el, {
			barColor: '#ef1e25',
			trackColor: '#f2f2f2',
			scaleColor: '#dfe0e0',
			lineCap: 'round',
			lineWidth: 3,
			size: 110,
			animate: 1000,
			onStart: function() {},
			onStop: function() {}
		});
	});

	document.querySelector('.updatePieCharts').addEventListener('click', (e) => {
		e.preventDefault();
		let newValue = Math.floor(100 * Math.random());
		document.querySelectorAll('.chart').forEach((el) => {
			let chart = el.__easyPieChartInstance;
			if (chart) {
				chart.update(newValue);
				el.querySelector('span').textContent = newValue;
			}
		});
	});

	// Assign the chart instance to the element for future reference
	HTMLElement.prototype.__easyPieChartInstance = null;
	document.querySelectorAll('.chart').forEach((el) => {
		el.__easyPieChartInstance = new EasyPieChart(el, {
			barColor: '#ef1e25',
			trackColor: '#f2f2f2',
			scaleColor: '#dfe0e0',
			lineCap: 'round',
			lineWidth: 3,
			size: 110,
			animate: 1000,
			onStart: function() {},
			onStop: function() {}
		});
	});*/
//})();
