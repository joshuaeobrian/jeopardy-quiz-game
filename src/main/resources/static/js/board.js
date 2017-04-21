/**
 * Created by josh on 4/14/17.
 */
$(document).ready(function () {
	$(".pop-up-window").hide();
	$(".response-board button").prop("disabled", true);
	const sessionId = document.getElementById("sessionId");

	$(".response-board-header h4").html("Please Select A Tile!");

		const buttons = document.querySelectorAll(".response-board button");

		$(".flippable").click(function (e) {

			if($("#points").text() !=0) {
				const flipped = document.getElementsByClassName("flip");
				if (flipped.length < 1) {
					$(this).toggleClass("flip");
					$(this).attr("id", "overlay");

					let questionid;
					let categoryid;

					const backBoard            = $("#overlay .back");
					const input                = $("#overlay");
					backBoard [0].style.height = "150px";
					console.log();
					questionid = $("#overlay input[name=questionid]").val();
					categoryid = $("#overlay input[name=categoryid]").val();


					$.post("/Card",
						{
							questionId: questionid,
							categoryId: categoryid,
						},
						function (response) {
							console.log(response);
							$(".response-board-header h4").html("Please choose an Answer!");


							$(".response-board button").prop("disabled", false);
							for (let i = 0; i < buttons.length; i++) {
								buttons[i].textContent = response[i]['answer'];
								buttons[i].value       = response[i]['id'];
								buttons[i].id          = response[i]['questionId'];
								buttons[i].className   = "options";
							}

						}
					);
				}
				let minutes   = 0;
				let seconds   = 30;


				let isTimeToStop = false;
				function countDown() {
					console.log(isTimeToStop);
					let timer = document.getElementById("clock");

					let currentSec;
					let currentMin;
					seconds--;
					if (seconds < 0) {
						minutes--;
						seconds = 30;
						if (minutes <= 0) {
							minutes = 0;

						}
					}
					if(seconds > 10){
						isTimeToStop = true;
					}
					if (seconds < 10) {
						currentSec = "0" + seconds;
						if(seconds < 1 && isTimeToStop){
							console.log("Stop");
							timer.innerHTML =  "00:00";

							$.post("/outOfTime",
								{
									questionId: $("#overlay input[name=questionid]").val(),
									sessionId: sessionId.value,
								},
								function (response) {
									$("#points").html(response[0]);
									$("#overlay").addClass("done");
									$("#overlay").removeClass("flip");

									$("#overlay").removeAttr("id");
									$(".response-board-header h4").html("Sorry, Ran out of time!");
									for(let i =0; i < buttons.length; i++){
										if(buttons[i].value == response[1]){
											buttons[i].className = "correct";
										}

									}
								}

							);
							Stop();
						}
					} else {
						currentSec = seconds;
					}
					if (minutes < 10) {
						currentMin = "0" + minutes;
					} else {
						currentMin = minutes;
					}
					if (minutes <= 0 && seconds <= 0) {

					} else {
						timer.innerHTML = currentMin + ":" + currentSec;

					}


				}

				let timer = setInterval(function(){countDown(false)}, 500)
				
				function Stop() {
					clearInterval(timer);
				}

				/**
				 * if Timer runs out of time flash out of time
				 * disable buttons
				 * then deduct points
				 */
			}else{
				$(".pop-up-window").show();
				$(".response-board-header h4").html("Sorry No More Points!");


				$(".pop-up-window h3").html("Sorry, out of money!");
				$(".pop-up-window label").html("Would you like to log off?");
				$(".pop-up-btn button").click(function (e) {
					const button = e.target.textContent;
					console.log(button);
					const action = {
							Yes: ()=>{
								document.location.href = "/login";
							},
							No: ()=>{
								$(".pop-up-window").hide();
							}
						}
					action[button]();
					});

			}
			$(".response-board button").click(function () {
				let timer = document.getElementById("clock");
				timer.innerHTML = "00:00";
				Stop();
			});
		});

});