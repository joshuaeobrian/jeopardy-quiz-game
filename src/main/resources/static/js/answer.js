/**
 * Created by josh on 4/14/17.
 */
$(document).ready(function () {
	const sessionId = document.getElementById("sessionId");
	const points = document.getElementById("points");
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
			 * need to add button changing colors on if
			 * answer is right or wrong.
			 * @param response
			 */
			function (response) {
				console.log(response[0])
				//let json = jQuery.parseJSON(response);
				points.textContent = response[1];
				$("#overlay").addClass("done");
				$("#overlay").removeClass("flip");
				id.textContent="";
				$("#overlay").removeAttr("id");
				if(response[0] === false){
					//$(this).removeClass("options");
					button.className = "wrong";
				}else{
					button.className = "correct";
				}


				//if(!json.isAnswer){
				//	console.log(json.isAnswer);
				//
				//	//MAKE WORK
				//	$(this).toggleClass("wrong");
				//}
			}
		);
		const doneTiles = document.getElementsByClassName("done");
		console.log(doneTiles.length);
		if(doneTiles.length === 24){
			document.location.href = "/game"

		}
	});
});