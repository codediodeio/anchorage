$('.btn-async').on('click', function () {
  $(this).button('loading');
});

$(document).ajaxStart(function(){
  $(".spinner").show();
});

$(document).ajaxStop(function(){
  $(".spinner").hide();
});

$(function () {
  $('[data-toggle="tooltip"]').tooltip();
});

$(".btn-unanchor").on('mouseenter', function(){
  $(this).removeClass('btn-success');
  $(this).addClass('btn-danger');
  $(this).html('<i class="hi hi-anchor"></i> unanchor!');
}).on('mouseleave', function(){
  $(this).removeClass('btn-danger');
  $(this).addClass('btn-success');
  $(this).html('<i class="hi hi-anchor"></i> anchored');
});

$(".imagebox").on('mouseenter', function(){
  $(this).find('.image-caption').show();
  $(this).find('img').fadeTo( 100 , 0.25, function() {});
}).on('mouseleave', function(){
  $(this).find('.image-caption').hide();
  $(this).find('img').fadeTo( 100 , 1, function() {});
});


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
