$(document).on("page:fetch", function(){
  $("#pageLoading").show();
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


  var runMason = function() {
    var $container = document.querySelector('#masonryFeed');
    if (typeof msnry === "undefined") {
      $("#masonryFeed").waitForImages( function() {
        var msnry = new Masonry( $container, {
          itemSelector: '.item',
          columnWidth: '.item',
          percentPosition: true
        });
      });

    } else if ($('#masonryFeed').length) {
      $("#masonryFeed").waitForImages( function() {
        $container.masonry('reload');
      });
    }
  };
  runMason();



  // var container = document.querySelector('#masonryFeed');
  // var msnry = new Masonry( container, {
  // // options...
  //   itemSelector: '.item',
  //   columnWidth: '.item'
  // });


  $(".imagebox").on('mouseenter', function(){
    $(this).find('.image-caption').show();
    $(this).find('img').fadeTo( 100 , 0.25, function() {});
  }).on('mouseleave', function(){
    $(this).find('.image-caption').hide();
    $(this).find('img').fadeTo( 100 , 1, function() {});
  });

  $(".btn-unanchor").on('mouseenter', function(){
    $(this).removeClass('btn-success');
    $(this).addClass('btn-danger');
    $(this).html('<i class="fa fa-anchor"></i> unanchor!');
  }).on('mouseleave', function(){
    $(this).removeClass('btn-danger');
    $(this).addClass('btn-success');
    $(this).html('<i class="fa fa-anchor"></i> anchored');
  });


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
    serviceUrl: '/locations/autocomplete.json',
    noCache: true,
    onSelect: function (suggestion) {
      $("#search").find('input').focus();
      $("#searchForm").submit();
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

  // Async Buttons

  $('.btn-async').on('click', function () {
    $(this).button('loading');
  });

  // Infinite Scroll
  if ($("#locationFeed").length) {

    $('.pagination a').attr('data-remote', 'true');
    $('.pagination a').hide();
    $('.pagination .previous_page').hide();
    $('.pagination .current').hide();
    $('.pagination .next_page').show().text("Load More").addClass('btn btn-primary');


    if ($('.pagination').length) {
      $(window).scroll(function() {
        var url = $('.pagination .next_page').attr('href');
        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
          $('.pagination').html(
            "<button type='button' class='next_page btn btn-primary'><i class='fa fa-refresh fa-spin'></i> Loading More...</button>"
          );
          return $.getScript(url);
        }
      });
      return $(window).scroll();
    }

  }

  if ($("#masonryFeed").length && $("#staticPagination").length===0) {

    $('.pagination a').attr('data-remote', 'true');
    $('.pagination a').hide();
    $('.pagination .previous_page').hide();
    $('.pagination .current').hide();
    $('.pagination .next_page').show().text("Load More").addClass('btn btn-primary btn-sm btn-async');

  }

  // HomePage Banner Effect
  if ($('#homeBanner').length ) {

    var checkWidth = function(){
      if($(window).width() <= 992){

        $('<img/>').attr('src', 'https://storage.googleapis.com/anchorage/assets/anchorageio-banner1-mobile.jpg').load(function() {
           $(this).remove();
           $('.sailing-banner').css('background-image', 'url(https://storage.googleapis.com/anchorage/assets/anchorageio-banner1-mobile.jpg)');
        });

      } else {

        $('<img/>').attr('src', 'https://storage.googleapis.com/anchorage/assets/anchorageio-banner1-web.jpg').load(function() {
           $(this).remove();
           $('.sailing-banner').css('background-image', 'url(https://storage.googleapis.com/anchorage/assets/anchorageio-banner1-web.jpg)');
        });
      }
    };

    checkWidth();

    $( window ).resize(function() {
      checkWidth();
    });

    $('#mainnav').addClass("transparent-nav");
    $('a').click(function(){
      $('#mainnav').removeClass("transparent-nav subtle-ease");
    });

    $('button').click(function(){
      $('#mainnav').removeClass("transparent-nav subtle-ease");
      $(window).unbind("scroll");
    });

    $(window).scroll(function() {

      var scrollPoint = $("#scrollPoint");
      if (scrollPoint.length) {

        var breakPoint = scrollPoint.offset().top - 50;
        var windscroll = $(window).scrollTop();
        var easeClass = "transparent-nav subtle-ease";
        $('#mainnav').addClass(easeClass);

        // Upper Page
        if (windscroll < breakPoint) {

          $('button').click(function(){
            $('#mainnav').removeClass("transparent-nav subtle-ease");
          });

            $(document).on("page:before-unload", function(){
              $(window).unbind("scroll");
            });


        //Lower Page
      } else if(windscroll >= breakPoint) {


          $('#mainnav').removeClass(easeClass);
          $('#mainnav').addClass('subtle-ease');

          }
        }
      }).scroll();

  }



});
