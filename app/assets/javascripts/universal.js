$(document).ready(function(){

	/* loading wheel spins before page loads */

	$("#spinning-wheel").show();
	$("#spinning-wheel").animate({rotate: '50000'}, 50000);

	$(window).load(function(){
		$("#spinning-wheel").hide();
		$(".hidden-container").css({"visibility":"visible"});
	});

	/* load best_in_place */

	jQuery(".best_in_place").best_in_place();
});