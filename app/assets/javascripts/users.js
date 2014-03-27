$(document).ready(function(){

	/* highlight background of input fields on focus */

	$(".edit-user-node input").focus(function(){
		$(".edit-user-node").animate({
			backgroundColor: "white"
		}, 300);

		$(".edit-user-node input").animate({
			backgroundColor: "white"
		}, 300);

		$(this).animate({
			backgroundColor: "#DCEBF2"
		}, 300);

		$(this).closest(".edit-user-node").animate({
			backgroundColor: "#DCEBF2"
		}, 300);
	});
});