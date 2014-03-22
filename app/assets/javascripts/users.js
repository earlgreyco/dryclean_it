$(document).ready(function(){
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();

	$(".side-item").click(function(){
		$(".side-item").css({"background" : "none", "color" : "#6e6e6e", "border-color" : "#e5e5e5"});
		$(this).css({"background" : "rgba(85, 151, 183, 1.0)", "color" : "white", "border-color" : "rgba(85, 151, 183, 1.0)"});
	});

	$("#new-article-wrapper input").focus(function(){
		$(".article-node input").animate({
			backgroundColor: "white"
		}, 300);

		$(".article-node").animate({
			backgroundColor: "white"
		}, 300);

		$(this).animate({
			backgroundColor: "#DCEBF2"
		}, 300);

		$(this).closest(".article-node").animate({
			backgroundColor: "#DCEBF2"
		}, 300);
	});

	$("#new-article").click(function(){
		$("#new-article-form").show("slide", { direction: "right" }, 300);
	});

	$("#dashboard-container").on("click", ".delete-article a", function(){
		$(this).parent().parent().remove();
	});

	$("#all-articles").on("click", ".delete-article a", function(){
		$(this).parent().parent().remove();
	});
})