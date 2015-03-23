$( document ).ready(function() {

//  $(function () {
//    $('[data-toggle="tooltip"]').tooltip()
//  });

  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5();
  });

  $(document).ajaxStart(function(){
    $(".weather-spinner").show();
  });

  $(document).ajaxStop(function(){
    $(".weather-spinner").hide();
  });

  // Search Box

  $('#openSearch').on("click", function(e){
    e.preventDefault();
    $("#search").slideToggle( "fast", function() {
      // Animation complete.
    });
  });

  $('#closeSearch').on("click", function(e){
    e.preventDefault();
    $("#search").slideUp( "fast", function() {
      // Animation complete.
    });
  });


  // $.ajax({
  //  url: "/location/weather/",
  //  cache: false,
  //  success: function(html){
  //    $("#weather").replaceWith(html);
  //  }
  // });



});
