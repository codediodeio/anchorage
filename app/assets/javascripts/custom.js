Turbolinks.enableTransitionCache();

$(document).on("page:fetch", function(){
  $("#pageLoading").show();
  $("#mainContent").hide();
  $("#search").hide();
});

$(document).on("page:receive", function(){
  $("#pageLoading").hide();
  $("#mainContent").show();
});

$(document).on('page:load', function(){
  window['rangy'].initialized = false
});


$( document ).ready(function() {

  $(function () {
    $('[data-toggle="tooltip"]').tooltip();
  });

  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5({
      toolbar: {
        "fa": true,
        "font-styles": true, //Font styling, e.g. h1, h2, etc. Default true
        "emphasis": true, //Italics, bold, etc. Default true
        "lists": true, //(Un)ordered lists, e.g. Bullets, Numbers. Default true
        "html": false, //Button which allows you to edit the generated HTML. Default false
        "link": true, //Button to insert a link. Default true
        "image": false, //Button to insert an image. Default true,
        "color": false, //Button to change color of font
        "blockquote": false, //Blockquote
        "size": "sm" //default: none, other options are xs, sm, lg
      }
    });
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

  // Search AJAX


  $('#keyword').autocomplete({
    serviceUrl: '/autocomplete.json',
    onSelect: function (suggestion) {
      $("#search").find('input').focus();
    }
  });

  // Affix Guide Contents

  $('#guideContents').affix({
    offset: {
      top: 70,
    }
  });

  var $body   = $(document.body);
  var navHeight = $('#mainnav').outerHeight(true) + 10;

  $body.scrollspy({
    target: '#guideContents',
    offset: navHeight
  });


  // Fade Out Dismissable Alerts

  $(".alert-dismissible").delay(3000).fadeOut();

  // Type Effect

  $(function(){
    $(".typed").typed({
      strings: ["the Sea of Cortez",
      "Catalina Island",
      "San Diego Harbor",
      "Channel Islands National Park",
      "the San Francisco Bay Area",
      "the San Juan Islands",
      "Pacific Northwest Marinas"
      ],
      typeSpeed: 100
    });
  });



});
