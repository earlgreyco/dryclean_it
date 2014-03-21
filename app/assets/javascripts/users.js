$(document).ready(function(){
	$(".side-nav a").on('click', function(e) {
 		e.preventDefault();
	  $('.recipe-page').animate({ scrollTop: $(this.hash).offset().top }, 300);
	});
});