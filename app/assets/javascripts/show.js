$(function ()
{
  var thumbs = $('.thumb');
  thumbs.mouseover(function ()
  {
    var src = $(this).data('image')
    $('.item__main__photo').attr('src', src)
  });
})
