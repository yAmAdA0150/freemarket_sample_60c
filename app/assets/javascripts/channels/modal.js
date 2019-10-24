// モーダルポップアップ画面
$(function() {
  //モーダルを開く
  $('#delete_botton').click(function() {
    $('.modal--is_hidden').fadeIn();
  })
  //モーダルの外側か閉じるをクリックでモーダルを閉じる
  $('.modal-head-bottom__modal-btn-left').click(function() {
    $('.modal--is_hidden').fadeOut();
  })
  $('.modal--is_hidden').click(function() {
    $('.modal--is_hidden').fadeOut();
  })
});
