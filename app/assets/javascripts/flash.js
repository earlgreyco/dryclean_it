// Make flash messages fade out

$(document).ready(function() {
   $('.alert').delay(500).fadeIn('normal', function() {
      $(this).delay(10000).fadeOut();
   });
});