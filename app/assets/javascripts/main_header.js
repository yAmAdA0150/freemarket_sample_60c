
$(document).on('turbolinks:load', function () {
  
  $('topbar__under__left__choice').hover(function () {
    $(this).addClass('active');
    var children = $('.active').children('.topbar__under__left__choice__example__list');
    children.show();
  }, function () {
      $(this).removeClass('.active');
      $(this).hide('.topbar__under__left__choice__example__list');
  });


  $('.topbar__under__left__choice__example__list__type').hover(function () {
    $(this).addClass('action');
    var gchildren = ('.action').gchildren('.topbar__under__left__choice__example__list__type__category');
    gchildren.show();
  }, function () {
      $(this).removeClass('.action');
      $(this).hide('.topbar__under__left__choice__example__list__type__category');
  });

  $('.topbar__under__left__choice__example__list__type__category__menu').hover(function () {
    $(this).addClass('ready');
    var gchildren = ('.ready');
    gchildren.show();
  }, function () {
      $(this).removeClass('.ready');
      $(this).hide('.topbar__under__left__choice__example__list__type__category__menu__final').hide;
  });
});