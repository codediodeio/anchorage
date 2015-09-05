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
