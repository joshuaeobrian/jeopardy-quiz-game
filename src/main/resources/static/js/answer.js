/**
 * Created by josh on 4/14/17.
 */
$(document).ready(function () {




	$(".pop-up-window").attr("id","overlay-pop")
	const sessionId = document.getElementById("sessionId");
	const points = document.getElementById("points");
	const buttons = document.querySelectorAll(".response-board button");
	$(".response-board button").click(function (e) {
		const id  = document.getElementById("overlay");
		e.preventDefault();
		const button  = e.target;
		console.log(button);
		$.post("/checkAnswer",
			{
				answerId: button.value,
				questionId: button.id,
				sessionId: sessionId.value,
			},

			/**
			 * send back correct answer and highlight
			 * need to add button changing colors on if
			 * answer is right or wrong.
			 * @param response
			 */
			function (response) {
				console.log(response[0]);
				points.textContent = response[1];

				$("#overlay").addClass("done");
				$("#overlay").removeClass("flip");
				id.textContent="";
				$("#overlay").removeAttr("id");
				if(response[0] === false){
					button.className = "wrong";
					$(".response-board-header h4").html("Wrong!");
					console.log("Correct answer id: "+response[2]);
					for(let i =0; i < buttons.length; i++){
						console.log("Button id:"+  buttons[i].value+ " Button: "+buttons[i].textContent);
						if(buttons[i].value == response[2]){
							console.log("Button id:"+  buttons[i].value+ " Button: "+buttons[i].textContent);
							buttons[i].className = "correct";
						}
					}
				}else{
					button.className = "correct";
					$(".response-board-header h4").html("Correct!");
				}
				$(".response-board button").prop("disabled",true);

			}
		);
		const doneTiles = document.getElementsByClassName("done");
		console.log(doneTiles.length);
		if(doneTiles.length === 24){
			$(".pop-up-window").show();


			$(".pop-up-btn button").click(function (e) {
				const button = e.target.textContent;
				console.log(button);
				const action = {
					Yes: ()=>{
						document.location.href = "/game";
					},
					No: ()=>{
						document.location.href = "/login";
					}
				}
				action[button]();

			});

		}
	});
});