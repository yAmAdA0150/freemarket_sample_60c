$(function() {
    var parentSelect = $("#parent_select1");
    var categoryChild = $('#category_child1');
    var categoryGchild = $('#select_gchild1');
    var hiddenField = $('#hidden-field1');
    // 子カテゴリーの非同期表示
    parentSelect.on("change", function() {
 
        var chooseParent = $(this).val();

        $.ajax({
            type: 'GET',
            url: '/api/categories',
            data: { parent: chooseParent },
            dataType: 'json'
            })
        .done(function(children) {

            categoryGchild.css({
                'display': 'none'
            })
            categoryChild.css({
                'display': 'block'
            })

            categoryChild.empty();
            categoryChild.append(`<option value="${chooseParent}"> すべて </option>`);

            function appendChild(child) {
                var html = `<option value=${child.id} class="${child.id}">${child.name}</option>`
                categoryChild.append(html);
            }
            if (children.length !== 0) {
                children.forEach(function(child) {
                    appendChild(child);
                });
            }

        })
        .fail(function() {
            alert('何かがおかしいです。');
        })
        });
    // 孫カテゴリーの非同期表示
        $(document).ajaxStop(function() {
            categoryChild.on("change", function() {
                var chooseChild = $(this).val();
                $.ajax({
                    type: 'GET',
                    url: '/api/categories',
                    data: { child: chooseChild },
                    dataType: 'json'
                })
                .done(function(children) {
                    categoryGchild.css({
                      'display': 'none'
                    })

                    categoryGchild.css({
                        'display': 'grid'
                    })
                    // selectSize.empty();
                    categoryGchild.empty();
                    function appendGchild(child) {
                        var html = `<div class="search-box__body__form__category__gchild__checkbox">
                                      <input id="category_id_in_${child.id}" name="gchild[]" type="checkbox" value="${child.id}">
                                      <label for="category_id_in_${child.id}">
                                      ${child.name}
                                    </label>
                                    </div>
                        `
                        categoryGchild.append(html);
                    }
                    if (children.length !== 0) {
                        children.forEach(function(child) {
                            appendGchild(child);
                        });
                    }
                })
                .fail(function() {
                    alert('何かがおかしいです。');
                })
            });
        });
  // インクリ
        var search_list = $("#brand-search-result");
        function appendBrand(brand) {
          var html = `<div class="brand-name" name="q[brand_id_eq][]" value="${brand.id}">${brand.name}</div>`
          search_list.append(html);
        }
        function appendErrMsgToHTML(msg) {
          var html = `<div class="box">${ msg }</div>`
          search_list.append(html);
        }

        $("#search-input").on("keyup", function() {

              var input = $("#search-input").val();

              search_list.css({
                'display': 'none'
              })

              $.ajax({
                type: 'GET',
                url: '/api/categories',
                data: { brand: input },
                dataType: 'json'
              })

              .done(function(brands) {
                  if (brands.length !== 0) {

                    search_list.css({
                      'display': 'block'
                    })

                    search_list.empty();
                    brands.forEach(function(brand){
                      appendBrand(brand);
                    })
                  }
                  else {
                    appendErrMsgToHTML("一致するブランドがありません");
                  }
              })
              .fail(function() {
                alert('何かがおかしいです。');
              })

              $(document).ajaxStop(function(){

              var brandAll = $('.brand-name')

              brandAll.on("click", function() {
                // debugger
                  var hiddenValue = $(this).attr('value');
                  var inputName = $(this).text();

                  search_list.css({
                      'display': 'none'
                  })

                  var brandInput = $('#search-input');
                  brandInput.val('');
                  brandInput.val(inputName);
                  hiddenField.val('');
                  hiddenField.val(hiddenValue);
                  
                });
            });
        });

        $(function() {

            $(window).on('load', function() { 
              hiddenField.val('');
            });

        });
      
  // size
      $(function() {
            $('#select_size').on("change", function() {

                var resultSize = $('#result_size');
                var chooseSize = $(this).val();

                $.ajax({
                    type: 'GET',
                    url: '/api/categories',
                    data: { size: chooseSize },
                    dataType: 'json'
                })
                .done(function(sizes) {

                    resultSize.css({
                        'display': 'grid'
                    })

                    resultSize.empty();

                    function appendSize(size) {

                        var html = `<div class="search-box__body__form__size__checkboxes__checkbox">
                                      <input id="size_id_in_${size.id}" name="q[size_id_in][]" type="checkbox" value="${size.id}">
                                      <label for="size_id_in_${size.id}">${size.name}</label>
                                    </div>`

                        resultSize.append(html);
                    }
                    if (sizes.length !== 0) {
                        sizes.forEach(function(size) {
                            appendSize(size);
                        });
                    }
                })
                .fail(function() {
                    alert('何かがおかしいです。');
                })
            });

            $(".search-box__body__form__btn__clear").bind("click", function(){
              $(this.form).find("textarea, :text").val("").end().find(":checked").prop("checked", false);
        });
      });

});