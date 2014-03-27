$(document).ready(function(){

	/* light up background of input fields */

	$(".form-field input").focus(function(){
		$(".form-field").animate({
			backgroundColor: "white"
		}, 300);

		$(".form-field input").animate({
			backgroundColor: "white"
		}, 300);

		$(this).animate({
			backgroundColor: "#DCEBF2"
		}, 300);

		$(this).closest(".form-field").animate({
			backgroundColor: "#DCEBF2"
		}, 300);
	});

	/* toggle between signup and signin form */

	$("#signin-link, #header-signin-link").click(function(){
		$("#signup-form").hide("slide", { direction: "right" }, 300);
		$("#signin-form").show("slide", { direction: "left" }, 300);
	});

	$("#signup-link").click(function(){
		$("#signup-form").show("slide", { direction: "right" }, 300);
		$("#signin-form").hide("slide", { direction: "left" }, 300);
	});
})