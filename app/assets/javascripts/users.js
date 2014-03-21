$(document).ready(function(){
	$('.side-nav ol a').on('click', function(event) {
	  var to = $(this).attr('href');
	  $('#recipe-page').animate({ scrollTop: $(to).offset().top }, 500);
	  event.preventDefault();
	});
});