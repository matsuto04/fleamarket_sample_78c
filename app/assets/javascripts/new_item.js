$(function() {

  var dropArea = document.getElementById("SellMainFormContainer__img");
  
  window.onload = function(e){
    //ドラッグした要素がドロップターゲットの上にある時にイベントが発火
    dropArea.addEventListener("dragover", function(e){
      e.preventDefault();
      //ドロップエリアに影がつく
      $(this).children('#items').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
    },false);
    //ドラッグした要素がドロップターゲットから離れた時に発火するイベント
    dropArea.addEventListener("dragleave", function(e){
      e.preventDefault();
      $(this).children('#items').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})      
    },false);
    //ドラッグした要素をドロップした時に発火するイベント
    dropArea.addEventListener("drop", function(e) {
      e.preventDefault();
      $(this).children('#items').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});
      var files = e.dataTransfer.files;
      //ドラッグアンドドロップで取得したデータについて、プレビューを表示
      $.each(files, function(i,file){
        //アップロードされた画像を元に新しくfilereaderオブジェクトを生成
        var fileReader = new FileReader();
        //dataTransferオブジェクトに値を追加
        dataBox.items.add(file)
        file_field.files = dataBox.files
        //lengthで要素の数を取得
        var num = $('.SellMainFormContainer__img__dropBox').length + i + 1
        //指定されたファイルを読み込む
        fileReader.readAsDataURL(file);
        // 10枚プレビューを出したらドロップボックスが消える
        if (num==10){
          $('#items').css('display', 'none')   
        }
        //image fileがロードされた時に発火するイベント
        fileReader.onload = function() {
          //変数srcにresultで取得したfileの内容を代入
          var src = fileReader.result
          var html =`<div class='item-image' data-image="${file.name}">
                      <div class=' item-image__content'>
                        <div class='item-image__content--icon'>
                          <img src=${src} width="114" height="80" >
                        </div>
                      </div>
                      <div class='item-image__operetion'>
                        <div class='item-image__operetion--delete'>削除</div>
                      </div>
                    </div>`
        //image-box__containerの前にhtmlオブジェクトを追加　
        $('#items').before(html);
        };
        //image-box__containerにitem-num-(変数)という名前のクラスを追加する
        $('#items').attr('class', `SellMainFormContainer__img__dropBox${num}`)
      })
    })
  }
})