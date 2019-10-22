$(function() {

    // 変数定義
    var count = 0;
    // ドラックドロップを保持
    var list = new DataTransfer();
    // ２つのドロップボックスを定期
    var dropBox1 = $("#dropbox1");
    var dropBox2 = $("#dropbox2");
    var dropFile = $('#item-drop-zone');

    // ドラッグアンドドロップ枠1を縮める関数
    function deleteWidth1(num) {
        var del = 615 - num * 126
        dropBox1.css('width', `${del}px`)

    }
    // ドラッグアンドドロップ枠2を縮める関数
    function deleteWidth2(num) {
        var num = num - 5
        if (num > 0) {
            var del = 615 - num * 126
            dropBox2.css('width', `${del}px`)
        }
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
                // 画像10枚以上は投稿させない
                if (count > 10) {
                    count -= 1
                    return false;
                }
                list.items.add(file);
                var reader = new FileReader();
                reader.onload = function(e) {
                    var loadedImageUri = e.target.result;
                    var html = `<li class="contents-item__container__uploadbox__zone-item__have-item--upload-item">
                                <figure class="contents-item__container__uploadbox__zone-item__have-item--upload-figure">
                                <img alt="test" src="${loadedImageUri}" class="contents-item__container__uploadbox__zone-item__have-item--upload-image">
                                </figure>
                                <div class="contents-item__container__uploadbox__zone-item__have-item__upload-btnbox">
                                <a class="contents-item__container__uploadbox__zone-item__have-item--upload-btn" id="pict-edit">編集</a>
                                <a class="contents-item__container__uploadbox__zone-item__have-item--upload-btn btn-left" href="#" data-pict="${file.name}" id="pict-delete">削除</a>
                                </div>
                                </li>`;
                    if (count < 5) {
                        var num = input.files.length
                        num += edit_num
                        deleteWidth1(num)
                        dropBox1.before(html);
                    } else if (count == 5) {
                        $('.camera-image').css('display', `none`)
                        $('.inner_text').css('display', `block`)
                        dropBox1.css('display', `none`)
                        dropBox2.css('display', `inline-block`)
                        dropBox1.before(html);
                        dropBox2.append(dropFile)
                    } else if (count < 10) {
                        var num = input.files.length
                        num += edit_num
                        deleteWidth2(num)
                        dropBox1.before(html);
                    } else if (count > 9) {
                        dropBox1.before(html);
                        dropBox2.css('display', `none`)

                    } else {
                        return false
                    }
                    if (count == 4) {

                        $('.camera-image').css('display', `block`)
                        $('.inner_text').css('display', `none`)
                    } else if (count == 9) {

                        $('.camera-image').css('display', `block`)
                        $('.inner_text').css('display', `none`)
                    } else {
                        return false
                    }

                }
                reader.readAsDataURL(input.files[index])
            })
        }
    }

    // inputタグに変化があれば発火
    $(document).on("change", "#item-drop-zone", function() {
        count = $('.contents-item__container__uploadbox__zone-item__have-item--upload-item').length
        var edit_num = 0
        if ($('#pict-delete-edit').length) {
            edit_num = $('#pict-delete-edit').length
        }
        readURL(this, list, edit_num);
        appendFile(list);

    });

    // new - 削除ボタンがクリックされたら発火
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
        maxspace = 4
        if (count < 4) {
            deleteWidth1(count)
        } else if (count == maxspace) {
            var width = 615 - 126 * maxspace
            dropBox1.css("width", `${width}px`)
            dropBox1.css("display", `inline-block`)
            dropBox2.css("display", `none`)
            $('.camera-image').css('display', `block`)
            $('.inner_text').css('display', `none`)
            dropBox1.append(dropFile)
        } else if (count == 9) {
            var width = 615 - 126 * 4
            dropBox2.css("width", `${width}px`)
            dropBox2.css("display", `inline-block`)
            $('.camera-image').css('display', `block`)
            $('.inner_text').css('display', `none`)
        } else {
            deleteWidth2(count)
        }
        if (count == 3) {

            $('.camera-image').css('display', `none`)
            $('.inner_text').css('display', `block`)
        } else if (count == 5) {
            $('.inner_text').css('display', `block`)
        } else if (count == 8) {
            $('.camera-image').css('display', `none`)
            $('.inner_text').css('display', `block`)
        }
    })

    // edit - 削除ボタンがクリックされたら発火
    $(document).on("click", "#pict-delete-edit", function(e) {
        e.preventDefault();
        var target = $(e.target);
        var pict_id = target.data('delete');
        count = $('.contents-item__container__uploadbox__zone-item__have-item--upload-item').length
        target.parent().parent().remove();

        count -= 1
        maxspace = 4
        if (count < 4) {
            deleteWidth1(count)
        } else if (count == maxspace) {
            var width = 615 - 126 * maxspace
            dropBox1.css("width", `${width}px`)
            dropBox1.css("display", `inline-block`)
            dropBox2.css("display", `none`)
            $('.camera-image').css('display', `block`)
            $('.inner_text').css('display', `none`)
            dropBox1.append(dropFile)
        } else if (count == 9) {
            var width = 615 - 126 * 4
            dropBox2.css("width", `${width}px`)
            dropBox2.css("display", `inline-block`)
            $('.camera-image').css('display', `block`)
            $('.inner_text').css('display', `none`)
        } else {
            deleteWidth2(count)
        }
        if (count == 3) {
            $('.camera-image').css('display', `none`)
            $('.inner_text').css('display', `block`)
        } else if (count == 5) {
            $('.inner_text').css('display', `block`)
        } else if (count == 8) {
            $('.camera-image').css('display', `none`)
            $('.inner_text').css('display', `block`)
        }


        hidden_form = `<input type="hidden", name="[delete_ids][]", value="${pict_id}">`
        $('.contents-item__container__uploadbox__zone-item').append(hidden_form)

    })

});