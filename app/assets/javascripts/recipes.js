$(document).ready(function(){
	/* scrollspy for recipe show page */

	$("#images-link").hover(function(){
		$(this).tooltip('toggle');
	});

	$("#story-link").hover(function(){
		$(this).tooltip('toggle');
	});

	$("#recipe-link").hover(function(){
		$(this).tooltip('toggle');
	});

	$("#comments-link").hover(function(){
		$(this).tooltip('toggle');
	});

	$("#recipe-scroll ul li a[href^='#']").on('click', function(e) {
 		e.preventDefault();
	  $('html, body').animate({ scrollTop: $(this.hash).offset().top }, 300);
	});
		

	/* delete recipe */

	$('.delete-recipe').click(function(){
		$(this).parent().remove();
	});
});