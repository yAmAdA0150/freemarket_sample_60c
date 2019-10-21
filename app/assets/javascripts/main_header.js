$(function () {

  var categorySearch = $("#search");
  categorySearch.on("mouseenter", function () {
    $(".all-category").css({
      'display': `block`
    });
    $("#left").css({
      'display': `block`
    });
    $("#center").css({
      'display': 'none'
    });
    $("#right").css({
      'display': 'none'
    });
  });
  $("#search").on("mouseleave", function () {
    $(".all-category").css({
      'display': 'none'
    });
  });


  $(".all-category__first__type").on("mouseenter", function () {
    var parent = $(this).attr('value');
    $.ajax({
      type: 'GET',
      url: '/api/categories',
      data: { parent: parent },
      dataType: 'json'
    })
      .done(function (children) {
        var childCategory = $('#center');
        childCategory.css({
          'display': `block`
        });

        function appendChild(child) {
          var html = `<a href="/categories/child.id", class="link"><option value="${child.ancestry}/${child.id}", class="category-child" >${child.name}</option></a>`
          childCategory.append(html);
        }
        if (children.length !== 0) {
          childCategory.empty();
          children.forEach(function (child) {
            appendChild(child);
          });
        };
      });
  });
  $(".all-category__first__type").on("mouseenter", function () {
    $("#right").css({
      'display': 'none'
    });
  });

  $(function () {
    $(document).on("mouseenter", ".category-child", function () {
      var child = $(this).attr('value');
      $.ajax({
        type: 'GET',
        url: '/api/categories',
        data: { child: child },
        dataType: 'json'
      })
        .done(function (gchildren) {
          var gchildCategory = $('#right');
          gchildCategory.css({
            'display': `block`,
          });

          function appendGchild(gchild) {
            var html = `<a href="/categories/gchild.id", class="link"><option value="${gchild.id}", class="category-gchild">${gchild.name}</option></a>`
            gchildCategory.append(html);
          }
          if (gchildren.length !== 0) {
            gchildCategory.empty();
            gchildren.forEach(function (gchild) {
              appendGchild(gchild);
            });
          };
        });
    });
  });
});