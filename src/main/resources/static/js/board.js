/**
 * Created by josh on 4/14/17.
 */
$(document).ready(function () {

	$(".flippable").click(function (e) {
		$(this).toggleClass("flip");
		let x = e.target.parentNode;
		console.log(x);

		//when tile clicked show options of answers
		/**
		 *  make post request
		 */

		/**
		 * load options into button
		 */
	});

	var minutes = 2;
	var seconds = 0;
	const padding = "000";
	function countDown() {
		let timer = document.getElementById("clock");
		let currentSec;
		let currentMin;
		seconds--;
		if(seconds<=0){
			minutes--;
			seconds = 59;
			if(minutes<=0){
				minutes = 0;
			}
		}
		if(seconds<10){
			currentSec = "0"+seconds;
		}else{
			currentSec = seconds;
		}
		if(minutes<10){
			currentMin = "0"+minutes;
		}else{
			currentMin = minutes;
		}
		//var currentMinute = padding.substring(0, padding.length - minutes.length) + minutes;
		//var currentSec = padding.substring(0, padding.length - seconds.length) + seconds;
		if(minutes <=0 && seconds <=0 ) {

		}else{
			timer.innerHTML = currentMin + ":" + currentSec;
		}
	}
	setInterval(countDown,1000)
	
});