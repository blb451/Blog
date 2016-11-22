
$(document).on('turbolinks:load', function(){
  $('#form-submit-link').click(function(){
    $(this).parents('form').eq(0).submit();
  });
});


$(document).on('turbolinks:load', function(){
$( '.navbar i' ).click(function(){
  $('.responsive-menu').toggleClass('expand')})})
