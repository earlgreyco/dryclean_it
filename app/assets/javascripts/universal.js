$(document).ready(function(){

	/* loading wheel spins before page loads */
	
	$("#spinning-wheel").show();
	$("#spinning-wheel").animate({rotate: '15000'}, 50000);

	$(window).load(function(){
		$("#spinning-wheel").hide();
		$(".hidden-container").css({"visibility":"visible"});
	});
});