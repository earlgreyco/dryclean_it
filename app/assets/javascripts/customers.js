$(document).ready(function(){

	/* display form to create new customer */

	$("#new-customer").click(function(){
		$("#new-customer-form").show("slide", { direction: "right" }, 300);
	});

	/* highlight background of input field on focus */

	$(".customer-node input").focus(function(){
		$(".customer-node").animate({
			backgroundColor: "white"
		}, 300);

		$(".customer-node input").animate({
			backgroundColor: "white"
		}, 300);

		$(this).animate({
			backgroundColor: "#DCEBF2"
		}, 300);

		$(this).closest(".customer-node").animate({
			backgroundColor: "#DCEBF2"
		}, 300);
	});

	/* click customer image to display extra customer details */

	$("#customer-container").on("click", ".customer-img", function(){
		jQuery(".best_in_place").best_in_place();
		
		if(!$(this).hasClass("active-customer")){
			$(this).parent().children(".extra-customer-details").show("slide", {direction:"right"}, 300);
			$(this).parent().next("#new-order-form").show("slide", {direction:"left"}, 300);
			$(this).addClass("active-customer");
		}
		else{
			$(this).parent().children(".extra-customer-details").hide("slide", {direction:"right"}, 300);
			$(this).parent().next("#new-order-form").hide("slide", {direction:"right"}, 300);
			$(".order-history").hide("slide", {direction:"right"}, 300);
			$(this).removeClass("active-customer");
		}
	});

	/* show order history for customer */

	$("#customer-container").on("click", ".order-history-button", function(){
		$(".single-article").hide();
		$(".order-form").hide();
		$(this).parent().next(".order-history").show();
	});

	/* delete customer will hide modal and remove customer from customer index page */

	$("#customer-container").on("click", ".modal-footer a", function(){
		$(this).parent().parent().parent().parent().parent().parent().remove();
		$('body').removeClass('modal-open');
		$('.modal-backdrop').remove();
	});

	/* hide estimated pickup date to make room for real pickup datetime */

	$("#customer-container").on("click", ".pickup-button-action", function(){
		$(this).parent().parent().children(".estimated-date").hide();
		$(this).parent().hide();
	});
});