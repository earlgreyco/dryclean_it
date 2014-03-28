$(document).ready(function(){

	/* load form to create new article */

	$("#new-article").click(function(){
		$("#new-article-form").show("slide", { direction: "right" }, 300);
	});

	/* highlight background of input field on focus */

	$(".article-node input").focus(function(){
		$(".article-node").animate({
			backgroundColor: "white"
		}, 300);

		$(".article-node input").animate({
			backgroundColor: "white"
		}, 300);

		$(this).animate({
			backgroundColor: "#DCEBF2"
		}, 300);

		$(this).closest(".article-node").animate({
			backgroundColor: "#DCEBF2"
		}, 300);
	});

	/* delete article */

	$("#article-container").on("click", ".delete-article a", function(){
		$(this).parent().parent().parent().parent().parent().parent().remove();
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();
	});

	$("#article-container").on("click", ".delete-article a", function(){
		$(this).parent().parent().remove();
	});
});