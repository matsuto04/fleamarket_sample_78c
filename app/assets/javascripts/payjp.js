
//ログインした状態でのjsなので、エラー回避のためにコメントアウトしています

// $(document).on('turbolinks:load', function() {
//   //テスト鍵のセット
//   payjp.setPublicKey('sk_test_15e772991a03b9ebde1f7980');
//   //ボタンのイベントハンドリングリング
//   const btn = document.getElementById("token_submit");
//   btn.addEventListener('click', (e) => {
//     e.preventDefault();
//     // カードの情報生成
//     const card = {
//       number: $('#card_number').val(),
//       exp_month: $('#exp_month').val(),
//       exp_year: $('#exp_year').val(),
//       cvc: $('#cvc').val(),
//     };
//     // トークン生成
//       Payjp.createToken(card, (status, response) => {
//         if (status === 200) {//うまく行った場合200となる
//           //removeAttr("name")はデータを保持にしないように消している
//           $("#card_number").removeAttr("name");
//           $("#exp_month").removeAttr("name");
//           $("#exp_year").removeAttr("name");
//           $("#cvc").removeAttr("name");
//           //取得したトークンを送信できる状態にします
//           $("#charge-form").append(
//             $('<input type="hidden" name="payjp-token">').val(response.id)
//           );

//           $("charge-form").submit();
//           alert("登録が完了しました"); //確認用
//         } else {
//           alert("カード情報が正しくありません。"); //確認用
//         }
//     });
//   });
// })