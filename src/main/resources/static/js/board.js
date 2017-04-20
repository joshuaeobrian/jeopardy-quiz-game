/**
 * Created by josh on 4/14/17.
 */
$(document).ready(function () {
	const buttons = document.querySelectorAll(".response-board button");
	$(".flippable").click(function (e) {

		const flipped = document.getElementsByClassName("flip");
		console.log(flipped.length);
		if(flipped.length <1) {
			$(this).toggleClass("flip");
			$(this).attr("id", "overlay");

			let sectionClicked = e.target.parentNode;
			let questionid;
			let categoryid;
			//console.log(x.tagName);
			if (sectionClicked.tagName == 'LABEL') {

				sectionClicked = sectionClicked.parentNode;
			}
			questionid = sectionClicked.querySelectorAll('input')[0].value;
			categoryid = sectionClicked.querySelectorAll('input')[1].value;


			$.post("/Card",
				{
					questionId: questionid,
					categoryId: categoryid,
				},
				function (response) {
					console.log(response);

					for (let i = 0; i < buttons.length; i++) {
						buttons[i].textContent = response[i]['answer'];
						buttons[i].value       = response[i]['id'];
						buttons[i].id          = response[i]['questionId'];
						buttons[i].className   = "options";
					}

				}
			);
		}

	});

	var minutes = 1;
	var seconds = 0;
	const padding = "000";

	/**
	 * need to make timer stop
	 */
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
				if(seconds<1){
					clearInterval(timer);
				}
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
	let timer = setInterval(countDown,1000)
	
});