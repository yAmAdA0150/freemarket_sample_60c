$(function() {
  $('.slider').slick({
    autoplay:true,
    // arrows: strue,
    autoplaySpeed:5000,
    // dots:true,
    // nextArrow: '<img src = "https://web-jp-assets.mercdn.net/_next/static/images/carousel-next-bc3a1438a1435e953bc67d720cd05c61.png" class="slide-arrow next-arrow">'
  });
  // // adaptiveHeight:true,
  // // slidesToShow:3,
  // infinite: true, //スライドのループ有効化
  // dots:true, //ドットのナビゲーションを表示
  // centerMode: true, //要素を中央寄せ
  // centerPadding:'10%', //両サイドの見えている部分のサイズ
  // autoplay:true, //自動再生
    // arrows:true,
    // appendDots: $('.dots'),
    // appendArrows: $('.arrows'),
  // variableWidth:true,
  // slidesToShow: 1,ss
  // slidesToScroll:1,
  // asNavFor: null,
  // dotsClass: 'slide-dots'
  // appendDots:$("#apDots"),
  // dotsClass: 'slide-dots',
    // cssEase: 'linear',
    // prevArrow: '＜',
    // nextArrow: '＞'
  // prevArrow: '<img src="https://web-jp-assets.mercdn.net/_next/static/images/top-banner-super-exhibition-fes-1354ceda34bd06081a45ee755e911f07.jpg" class="prev-arrow">',
  // snextArrow: '<img src="https://web-jp-assets.mercdn.net/_next/static/images/carousel-prev-af7ca886ce42c4c02610cd15421ddcad.png" class="next-arrow">'
});
  
document.addEventListener("DOMContentLoaded", function() {
  function showElementAnimation() {

    var element = document.getElementsByClassName('item');
    if(!element) return; // 要素がなかったら処理をキャンセル
    
    var showTiming = window.innerHeight > 768 ? 200 : 40; // 要素が出てくるタイミングはここで調整
    var scrollY = window.pageYOffset;
    var windowH = window.innerHeight;

    for(var i=0;i<element.length;i++) { var elemClientRect = element[i].getBoundingClientRect(); var elemY = scrollY + elemClientRect.top; if(scrollY + windowH - showTiming > elemY) {
        element[i].classList.add('is-show');
      } else if(scrollY + windowH < elemY) {
        // 上にスクロールして再度非表示にする場合はこちらを記述
        element[i].classList.remove('is-show');
      }
    }
  }
  showElementAnimation();
  window.addEventListener('scroll', showElementAnimation);
})




