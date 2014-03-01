$(document).ready(function(){
  $("#next-btn-one").click(function(){
   	$("#create-recipe-one").hide();
   	$("#create-recipe-two").show();
   	$("textarea").css({"height": "20px"});
   	$("#create-recipe-two").animate({ marginLeft: "10%"} , 500);
   	$(".progress-bar").css({"width": "20%"});
   	$(".progress-bar").html("20%");
  });

  $("#next-btn-two").click(function(){
  	$("#create-recipe-two").hide();
  	$("#create-recipe-three").show();
  	$("#create-recipe-three").animate({ marginLeft: "10%"} , 500);
  	$(".progress-bar").css({"width": "40%"});
  	$(".progress-bar").html("40%");
  });

  $("#next-btn-three").click(function(){
  	$("#create-recipe-three").hide();
  	$("#create-recipe-four").show();
  	$("#create-recipe-four").animate({ marginLeft: "10%"} , 500);
  	$(".progress-bar").css({"width": "60%"});
  	$(".progress-bar").html("60%");
  });

  $("#next-btn-four").click(function(){
  	$("#create-recipe-four").hide();
  	$("#create-recipe-five").show();
  	$("#create-recipe-five").animate({ marginLeft: "10%"} , 500);
  	$(".progress-bar").css({"width": "80%"});
  	$(".progress-bar").html("80%");
  });

  $("#next-btn-five").click(function(){
  	$(".progress-bar").css({"width": "100%"});
  	$(".progress-bar").html("100%");
  });

  $("#back-btn-one").click(function(){
  	$("#create-recipe-two").hide();
  	$("#create-recipe-two").animate({ marginLeft: "100%" }, 500);
  	$("#create-recipe-one").show();
  	$("#create-recipe-one").animate({ marginLeft: "10%"}, 500);
  	$(".progress-bar").css({"width": "0%"});
  	$(".progress-bar").html("");
  });

  $("#back-btn-two").click(function(){
  	$("#create-recipe-four").hide();
  	$("#create-recipe-four").animate({ marginLeft: "100%" }, 500);
  	$("#create-recipe-three").show();
  	$("#create-recipe-three").animate({ marginLeft: "10%"}, 500);
  	$(".progress-bar").css({"width": "40%"});
  	$(".progress-bar").html("40%");
  });

  $("#back-btn-three").click(function(){
  	$("#create-recipe-five").hide();
  	$("#create-recipe-five").animate({ marginLeft: "100%" }, 500);
  	$("#create-recipe-four").show();
  	$("#create-recipe-four").animate({ marginLeft: "10%"}, 500);
  	$(".progress-bar").css({"width": "60%"});
  	$(".progress-bar").html("60%");
  });
});