/**
 * Created by josh on 4/14/17.
 */
$(document).ready(function () {
	const sessionId = document.getElementById("sessionId");
	const points = document.getElementById("points");
	$(".response-board button").click(function (e) {
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
				console.log(response)
				//let json = jQuery.parseJSON(response);
				points.textContent = response;
				//if(!json.isAnswer){
				//	console.log(json.isAnswer);
				//
				//	//MAKE WORK
				//	$(this).toggleClass("wrong");
				//}
			}
		);
	});
});