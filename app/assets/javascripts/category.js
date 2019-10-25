$(function() {
    var parentSelect = $("#parent_select");
    var categoryChild = $('#category_child');
    var categoryGchild = $('#select_gchild');
    var sizeBox = $('#size_box');
    var selectSize = $('#select_size');
    var hiddenField = $('#hidden-field');
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
                hiddenField.val('');

                var sizeBox = $('#size_box')
                sizeBox.css({
                    'display': 'none'
                })
                categoryGchild.css({
                    'display': 'none'
                })

                categoryChild.css({
                    'display': 'block'
                })
                categoryChild.empty();
                selectSize.empty();
                categoryChild.append(`<option> --- </option>`)

                function appendChild(child) {
                    var html = `<option value="${child.id}">${child.name}</option>`
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
                    sizeBox.css({
                        'display': 'none'
                    })
                    categoryGchild.css({
                        'display': 'block'
                    })
                    hiddenField.val('');
                    selectSize.empty();
                    categoryGchild.empty();
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
        var brandBox = $('#brand_box');
        categoryGchild.on("change", function() {
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
                        hiddenField.val('');

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
    var chargeChoice = $('#item_shipping_attributes_charge');
    chargeChoice.on("change", function() {
        var deliveryMethod = $('#delivery-method')
        deliveryMethod.css({
            'display': 'block'
        })
    })
});