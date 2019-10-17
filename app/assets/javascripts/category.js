$(function() {
    var categoryParent = $("#category_parent");
    var parentSelect = $("#parent_select");
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
                var sizeBox = $('#size_box')
                sizeBox.css({
                    'display': 'none'
                })
                $('#select_gchild').remove('');
                $('#category_child').remove('');
                var selectChild = $(`<select class="content__details__right__category__box__top" id="category_child"></select>`);
                categoryParent.append(selectChild)
                var categoryChild = $('#category_child')
                categoryChild.append(`<option> --- </option>`)

                function appendChild(child) {
                    var html = `<option value="${child.ancestry}/${child.id}" class="${child.ancestry}/${child.id}">${child.name}</option>`
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
        var categoryParent = $("#category_parent");
        var categoryChild = $('#category_child');
        categoryChild.on("change", function() {
            var chooseChild = $(this).val();
            $.ajax({
                    type: 'GET',
                    url: '/api/categories',
                    data: { child: chooseChild },
                    dataType: 'json'
                })
                .done(function(children) {
                    var sizeBox = $('#size_box')
                    sizeBox.css({
                        'display': 'none'
                    })
                    $('#select_gchild').remove('');
                    var selectGchild = $(`<select class="content__details__right__category__box__top" id="select_gchild" name="item[category_id]"></select>`);
                    categoryParent.append(selectGchild)
                    var categoryGchild = $('#select_gchild')
                    categoryGchild.append(`<option> --- </option>`)

                    function appendGchild(child) {
                        var html = `<option value="${child.id}">${child.name}</option>`
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
        // サイズの非同期表示
        var sizeBox = $('#size_box');
        var brandBox = $('#brand_box');
        var selectGchild = $('#select_gchild')
        selectGchild.on("change", function() {
            var chooseSize = $(this).val();
            $.ajax({
                    type: 'GET',
                    url: '/api/categories',
                    data: { size: chooseSize },
                    dataType: 'json'
                })
                .done(function(sizes) {
                    if (sizes.length !== 0) {
                        sizeBox.css({
                            'display': 'block'
                        })
                        brandBox.css({
                            'display': 'block'
                        })
                        var selectSize = $('#select_size');
                        selectSize.empty();
                        selectSize.append(`<option> --- </option>`)

                        function appendSize(size) {
                            var html = `<option value="${size.id}">${size.name}</option>`
                            selectSize.append(html);
                        }
                        sizes.forEach(function(size) {
                            appendSize(size);
                        });
                    }
                })
                .fail(function() {
                    alert('何かがおかしいです。');
                })
        });
        // ブランドインクリメンタルサーチ
        var brandInput = $('#brand_input')
        var searchResult = $('#search-result')
        brandInput.on("keyup", function() {
            var showBrand = $(this).val();
            searchResult.css({
                'display': 'none'
            })
            $.ajax({
                    type: 'GET',
                    url: '/api/categories',
                    data: { brand: showBrand },
                    dataType: 'json'
                })
                .done(function(brands) {
                    if (brands.length !== 0) {
                        searchResult.css({
                            'display': 'block'
                        })
                        searchResult.empty();

                        function appendBrand(brand) {
                            var html = `<div class="brand-name" value="${brand.id}">${brand.name}</div>`
                            searchResult.append(html);
                        }
                        brands.forEach(function(brand) {
                            appendBrand(brand);
                        });
                    }
                })
                .fail(function() {
                    alert('何かがおかしいです。');
                })

        })
        var brandAll = $('.brand-name')
        brandAll.on("click", function() {
            var hiddenValue = $(this).attr('value');
            var hiddenField = $('#hidden-field');
            var inputName = $(this).text();
            searchResult.css({
                'display': 'none'
            })
            var brandInput = $('#brand_input');
            brandInput.val('');
            brandInput.val(inputName);
            hiddenField.val('');
            hiddenField.val(hiddenValue);

        });
    });
    var chargeChoice = $('#charge-choice');
    chargeChoice.on("change", function() {
        var deliveryMethod = $('#delivery-method')
        deliveryMethod.css({
            'display': 'block'
        })
    })
});