$(document).on("page:fetch", function(){
  $("#pageLoading").show();
  $("#mainContent").hide();
  $("#search").hide();
});

$(document).on("page:receive", function(){
  $("#pageLoading").hide();
  $("#mainContent").show();
});


$( document ).ready(function() {

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5();
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


  $('#keyword').autocomplete({
    serviceUrl: '/autocomplete.json',
    onSelect: function (suggestion) {
      $("#search").find('input').focus();
    }
  });


});
