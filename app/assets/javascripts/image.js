// $(function() {
//     var image_area = $('#imagearea1');
//     var image_area2 = $('#imagearea2');
//     var dropzone_box = $('.upload_label');
//     var images = [];
//     var inputs = [];
//     var input_area = $('.input_area');
//     var image_box = $('#image-box');
//     var image_box2 = $('#image-box2');

//     //画像ファイルプレビュー表示のイベント追加 fileを選択時に発火するイベントを登録
//     $(document).on('change', 'input[type= "file"].upload-image', function(event) {
//         var file = $(this).prop('files')[0]; //propは指定した属性の値を取得する
//         var reader = new FileReader(); //FileReaderは選択した画像を読み込むためのオブジェクト
//         inputs.push($(this)); //inputタグを配列に入れて、後で画像を削除する時に使う
//         var img = $(`<div class= "img_view"><img></div>`);
//         reader.onload = function(e) { //onloadは画面の全要素を読み込み終えて初めてスクリプトが動き出す
//             var btn_wrapper = $('<div class="btn_wrapper"><div class="btn_edit">編集</div><div class="btn_delete">削除</div></div>');
//             img.append(btn_wrapper); //img要素の一番後ろにbtn_wrapperを挿入する
//             img.find('img').attr({ //img要素が指定された縦横比に置換される
//                 src: e.target.result,
//                 width: "120px",
//                 height: "140px",
//             })
//         }
//         reader.readAsDataURL(file); //readAsDataURLに引数でファイルを渡してあげることでreader.onloadから先の関数が動く
//         images.push(img); //imageを配列に入れて、後で画像を削除する時に使う

//         if (images.length >= 5) {
//             image_area2.css({
//                 'display': 'block'
//             })
//             image_area.css({
//                 'display': 'none'
//             })
//             $.each(images, function(index, image) {
//                 image.attr('data-image', index); //attrは指定した属性の値を取得
//                 image_box2.append(image);
//                 image_area2.css({
//                     'width': `calc(100% - (135px * ${images.length - 5}))`
//                 })
//             })
//             if (images.length == 9) {
//                 image_area2.find('p').replaceWith('<i class="fa fa-camera"></i>')
//             }
//         } else {
//             $('#image-box').empty(); //emptyは要素内の子要素(テキストも対象)を全て削除
//             $.each(images, function(index, image) {
//                 image.attr('data-image', index); //attrは指定した属性の値を取得
//                 image_box.append(image);
//             })
//             image_area.css({
//                 'width': `calc(100% - (135px * ${images.length}))`
//             })
//         }
//         if (images.length == 4) {
//             image_area.find('p').replaceWith('<i class="fa fa-camera"></i>')
//         }
//         if (images.length == 10) {
//             image_area2.css({
//                 'display': 'none'
//             })
//             return;
//         }
//         var new_image = $(`<input multiple= "multiple" name="images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
//         input_area.append(new_image);
//     });
//     // 削除ボタンを押すと発火
//     $(document).on('click', '.btn_delete', function() {
//         var target_image = $(this).parent().parent(); //削除ボタンの親の親要素（data-image）を変数target_imageに代入
//         $.each(inputs, function(index, input) {
//             if ($(this).data('image') == target_image.data('image')) {
//                 $(this).remove();
//                 target_image.remove();
//                 var num = $(this).data('image');
//                 images.splice(num, 1);
//                 inputs.splice(num, 1);
//                 if (inputs.length == 0) {
//                     $('input[type= "file"].upload-image').attr({
//                         'data-image': 0
//                     })
//                 }
//             }
//         })
//         $('input[type= "file"].upload-image:first').attr({
//             'data-image': inputs.length
//         })
//         $.each(inputs, function(index, input) {
//             var input = $(this)
//             input.attr({
//                 'data-image': index
//             })
//             $('input[type= "file"].upload-image:first').after(input)
//         })
//         if (images.length >= 5) {
//             image_area2.css({
//                 'display': 'block'
//             })
//             $.each(images, function(index, image) {
//                 image.attr('data-image', index);
//                 image_box2.append(image);
//             })
//             image_area2.css({
//                 'width': `calc(100% - (135px * ${images.length - 5}))`
//             })
//             if (images.length == 9) {
//                 image_area2.find('p').replaceWith('<i class="fa fa-camera"></i>')
//             }
//         } else {
//             image_area.css({
//                 'display': 'block'
//             })
//             $.each(images, function(index, image) {
//                 image.attr('data-image', index);
//                 image_box.append(image);
//             })
//             image_area.css({
//                 'width': `calc(100% - (135px * ${images.length}))`
//             })
//         }
//         if (images.length == 4) {
//             image_area2.css({
//                 'display': 'none'
//             })
//         }
//     })
// });


$(function() {

    // 変数定義
    var count = 0;
    var list = new DataTransfer();

    // ドラッグアンドドロップ枠を縮める関数
    function deleteWidth(num) {
        var del = 615 - num * 115
        $(".contents-item__container__uploadbox__zone-item__dropbox").css('width', `${del}px`)
    }

    // input[type=file]に、FileListを入力する関数
    function appendFile(list) {
        if (list.files && list.files[0]) {
            var myFileList = list.files;
            document.querySelector('input[type=file]').files = myFileList;
        }
    }

    // プレビューを表示する関数
    function readURL(input, list, edit_num) {
        if (input.files && input.files[0]) {
            $.each(input.files, function(index, file) {
                count += 1;
                if (count >= 6) {
                    count -= 1
                    return false;
                }
                list.items.add(file);
                var reader = new FileReader();
                var target_ul = $("#item-append-target");
                reader.onload = function(e) {
                    var loadedImageUri = e.target.result;
                    var html = `<li class="contents-item__container__uploadbox__zone-item__have-item--upload-item">
                                <figure class="contents-item__container__uploadbox__zone-item__have-item--upload-figure">
                                <img alt="test" src="${loadedImageUri}" class="contents-item__container__uploadbox__zone-item__have-item--upload-image">
                                </figure>
                                <div class="contents-item__container__uploadbox__zone-item__have-item__upload-btnbox">
                                <a class="contents-item__container__uploadbox__zone-item__have-item--upload-btn">編集</a>
                                <a class="contents-item__container__uploadbox__zone-item__have-item--upload-btn btn-left" href="#" data-pict="${file.name}" id="pict-delete">削除</a>
                                </div>
                                </li>`;

                    if (count < 5) {
                        var num = input.files.length
                        num += edit_num
                        deleteWidth(num)
                    } else {
                        $(".contents-item__container__uploadbox__zone-item__dropbox").hide()
                    }
                    target_ul.append(html);
                }
                reader.readAsDataURL(input.files[index]);
            })
        }
    }

    // inputタグに変化があれば発火
    $(document).on("change", "#item-drop-zone", function() {
        count = $('.contents-item__container__uploadbox__zone-item__have-item--upload-item').length
        var edit_num = 0
        if ($('.pict-delete-edit').length) {
            edit_num = $('.pict-delete-edit').length
        }
        readURL(this, list, edit_num);
        appendFile(list);

    });

    // 出品-削除ボタンがクリックされたら発火
    $(document).on("click", "#pict-delete", function(e) {
        e.preventDefault();
        var target = $(e.target);
        var pict_name = target.data('pict');
        target.parent().parent().remove();
        if (document.querySelector('input[type=file]').files.length == 1) {
            $('input[type="file"]').val(null);
            list.clearData();
        } else {
            $.each(list.files, function(index, file) {
                if (file.name == pict_name) {
                    list.items.remove(index);
                    return false
                }
            })
            appendFile(list)
        }

        count -= 1
        if (count == 4) {
            var width = 615 - 115 * 4
            $(".contents-item__container__uploadbox__zone-item__dropbox").show()
            $(".contents-item__container__uploadbox__zone-item__dropbox").css("width", `${width}px`)
        } else {
            deleteWidth(count)
        }
    })

    // 編集-削除ボタンがクリックされたら発火
    $(document).on("click", "#pict-delete-edit", function(e) {
        e.preventDefault();
        var target = $(e.target);
        var pict_id = target.data('delete');
        count = $('.contents-item__container__uploadbox__zone-item__have-item--upload-item').length
        target.parent().parent().remove();

        if (count == 5) {
            $('.contents-item__container__uploadbox__zone-item__dropbox').show();
        }
        deleteWidth(count - 1)

        count -= 1

        hidden_form = `<input type="hidden", name="[delete_ids][]", value="${pict_id}">`
        $('.contents-item__container__uploadbox__zone-item').append(hidden_form)

    })

});