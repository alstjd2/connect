
(function () {  
	
    window.onload = function () {
        window.setTimeout(function(){
            fadeout();
        })
    }
	 function fadeout() {
        document.querySelector('.preloader').style.opacity = '0';
        document.querySelector('.preloader').style.display = 'none';
		console.log("ddd");
    }
})();