$(document).ready(function(){


	/* edit recipe page */

	$(".edit-mode").click(function(){
		$('.best_in_place').best_in_place();
		$('.best_in_place').on();
		$('.remove-recipe-image').show();
		$('.add-recipe-image').show();
		$('.remove-ingredient').show();
		$('.add-ingredient').show();
		$('.remove-step').show();
		$('.add-step').show();
		$('.remove-recipe-image').show();
		$(this).hide();
		$(".edit-mode-off").show();
		$('.unclickable').addClass("best_in_place");
		$('.best_in_place').removeClass('unclickable');
	});

	$(".edit-mode-off").click(function(){
		$('.remove-recipe-image').hide();
		$('.add-recipe-image').hide();
		$('.recipe-image-button').hide();
		$('.remove-ingredient').hide();
		$('.add-ingredient').hide();
		$('.remove-step').hide();
		$('.add-step').hide();
		$('.remove-recipe-image').hide();
		$(this).hide();
		$('.edit-mode').show();
		$('.best_in_place').addClass("unclickable");
		$('.unclickable').removeClass("best_in_place");
	});


	/* add and remove recipe images */

	$(".remove-recipe-image").click(function(){
    $(this).parent().html("No image")
  });

  $(".add-recipe-image").click(function(){
  	$("#new-recipe-image-form").show();
  });


	/* add and remove ingredients */

	$(".remove-ingredient").click(function(){
		$(this).parent().remove();
	});

	$(".add-ingredient").click(function(){
		$("#new-ingredient-form").show();
	});


	/* add and remove steps */

	$(".remove-step").click(function(){
		$(this).parent().remove();
	});

	$('.add-step').click(function(){
		$("#new-step-form").show();
	});
});