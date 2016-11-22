
$(document).on('turbolinks:load', function(){
  $('#form-submit-link').click(function(){
    $(this).parents('form').eq(0).submit();
  });
});



jQuery(function($){ $( '.navbar i' ).click(function(){
  $('.responsive-menu').toggleClass('expand')})})
