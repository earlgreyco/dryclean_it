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

	$("#home-scroll a").on('click', function(e) {
 		e.preventDefault();
	  $('html, body').animate({ scrollTop: $(this.hash).offset().top }, 300);
	});

	$("#do-it-signup-button a").on('click', function(e) {
 		e.preventDefault();
	  $('html, body').animate({ scrollTop: $(this.hash).offset().top }, 300);
	});

	$("#signin-link").click(function(){
		$("#signup-form").toggle(300);
		$("#signin-form").toggle(300);
	});

	$("#signup-link").click(function(){
		$("#signup-form").toggle(300);
		$("#signin-form").toggle(300);
	});
})