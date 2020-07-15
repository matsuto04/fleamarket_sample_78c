$(function () {
  $(document).on('click', '.image_upload', function () {
    var preview = $('<div class="image-preview__wapper"><img class="preview"></div><div class="image-preview_btn"><div class="image-preview_btn_delete">削除</div></div>');
    var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text"><i class="fa fa-camera fa-4x"></i><div class="input-area display-none"><input class="hidden image_upload" type="file"></div></div></label></li>`)
    $ul = $('#previews')
    $li = $(this).parents('li');
    $label = $(this).parents('.upload-label');
    $inputs = $ul.find('.image_upload');
    $('.image_upload').on('change', function (e) {
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = function (e) {
        $(preview).find('.preview').attr('src', e.target.result);
      }
      $li.append(preview);
      $('#previews li').css({
        'width': `80px`
      })
      $label.css('display', 'none');
      $li.removeClass('input');
      $li.addClass('image-preview');
      $lis = $ul.find('.image-preview');
      if ($lis.length < 10) {
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `80px`
        })
      }
      $inputs.each(function (num, input) {
        $(input).removeAttr('name');
        $(input).attr({
          name: "product[images_attributes][" + num + "][image]",
          id: "images_attributes_" + num + "_image"
        });
      });
    });
  });
  $(document).on('click', '.image-preview_btn_delete', function () {
    var append_input = $(`<li class="input"><label class="upload-label"><div class="upload-label__text"><i class="fa fa-camera fa-4x"></i><div class="input-area display-none"><input class="hidden image_upload" type="file"></div></div></label></li>`)
    $ul = $('#previews')
    $lis = $ul.find('.image-preview');
    $li = $(this).parents('.image-preview');
    $li.remove();
    $lis = $ul.find('.image-preview');
    if ($lis.length == 9) {
      $ul.append(append_input)
    }
    $('#previews li:last-child').css({
      'width': `80px`
    })
  });
});