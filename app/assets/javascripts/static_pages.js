$(document).ready(function(){
	$(".signup-section input").focus(function(){
		$(".signup-section").animate({
			backgroundColor: "white"
		}, 300);

		$(".signup-section input").animate({
			backgroundColor: "white"
		}, 300);

		$(this).animate({
			backgroundColor: "#DCEBF2"
		}, 300);

		$(this).closest(".signup-section").animate({
			backgroundColor: "#DCEBF2"
		}, 300);
	});

	$("#signin-link").click(function(){
		$("#signup-form").hide("slide", { direction: "right" }, 300);
		$("#signin-form").show("slide", { direction: "left" }, 300);
	});

	$("#signup-link").click(function(){
		$("#signup-form").show("slide", { direction: "right" }, 300);
		$("#signin-form").hide("slide", { direction: "left" }, 300);
	});
})