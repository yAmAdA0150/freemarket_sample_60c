$(function () {

  var categorySearch = $("#search");
  categorySearch.on("mouseover", function () {
    $(".all-category").css({
      'display': `block`
    });
    $("#left").css({
      'display': `block`
    });
      // (function () {
      //   $(".all-category", "#left").css({
      //     'display': 'none'
      //   })
      // });
    
  });

  var categoryParent = $("#center");
  // var liCategory = $('.all-category__first__type');
  var categoryAll = $('.all-category__first__type')
  categoryAll.on("mouseover", function () {
      var parent = $(this).val();
      // debugger
      $.ajax({
        type: 'GET',
        url: '/api/categories',
        data: { parent: parent },
        dataType: 'json'
      })
        .done(function (children) {
          var childCategory = $('#center')
          childCategory.css({
            'display': `block`
          });
          children.forEach(function (child) {
            var selectChild = $(`<li class="all-category__second__menu" value="${child.ancestry}/${child.id}">${child.name}</li>`);
            categoryParent.append(selectChild)
          });
        });
 
  });

  $(function () {
    var categoryChild = $("#third")
    var listChild = $("#second")
    listChild.on("mouseover", function () {
      var child = $(this).val();
      $.ajax({
        type: 'GET',
        url: '/api/categories',
        data: { child: child },
        dataType: 'json'
      })
        .done(function (children) {
          var gchildCategory = ('#right')
          gchildCategory.css({
            'display': `block`
          })
          children.forEach(function (child) {
          var selectGchild = $(`<li class="all-category__third__list" value="${gchild.ancestry}/${gchild.id}">${gchild.name}</li>`);
          categoryChild.append(selectGchild)
          });
        });
    });
  });

  $(function () {
    var listGchild = $("right")
    listGchild.on("mouseremove", function () {
      var gchild = $(this).val();
      $.ajax({
        type: 'GET',
        url: '/api/categories',
        data: { gchild: gchild },
        dataType: 'json'
      })
        .done(function () {
          var allList = $('.all-category')
          allList.css({
            'display': 'block'
          });
        });
    });
  });
});



// $(function () {
//   $('#search').hover(function () {   //htmlで指定したid:searchにカーソルを合わせた際の動き
//     $($(this).children('#left'))     //idがleftを指定
//       .css('display', 'block')       //displayをnoneからblockへ変更
//   },
//     function () {                    //上のhover以外の動作をした時と指定
//       $($(this).children('#left'))   //idがleftを指定
//         .css('display', 'none')      //didplayをnoneへ変更
//     });
  
//   $('#parent').hover(function () {    //htmlで指定したid:parentにカーソルを合わせた際の動き
//     $($(this).children('#center'))    //id:centerを指定
//       .css('display', 'block')        //displayをnoneからblockへ変更
//   },
//     function () {                     //上のhover以外の動作をした時と指定
//       $($(this).children('#center'))  //id:centerを指定
//         .css('display', 'none')       //didplayをnoneへ変更
//     });
  
//   $('#child').hover(function () {     //htmlで指定したid:childにカーソルを合わせた際の動き
//     $($(this).children('#right'))     //id:rightrを指定
//       .css('display', 'block')        //displayをnoneからblockへ変更
//   },
//     function () {                     //上のhover以外の動作をした時と指定
//       $($(this).children('#right'))   //id:rightを指定
//         .css('display', 'none')       //didplayをnoneへ変更
//     });
// });
