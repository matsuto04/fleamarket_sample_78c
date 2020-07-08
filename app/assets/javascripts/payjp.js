$(document).on('turbolinks:load', function(){

  Payjp.setPublicKey('pk_test_0dd9a76082571f04f6405622');
  const btn = document.getElementById("token_submit");
  btn.addEventListener('click', (e) => {
    e.preventDefault();
    const card = {
      number: $('#card_number').val(),
      exp_month: $('#exp_month').val(),
      exp_year: $('#exp_year').val(),
      cvc: $('#cvc').val(),
    };
    Payjp.createToken(card, (status, response) => {
    if (status === 200) {
      $("#card_number").removeAttr("name");
      $("#exp_month").removeAttr("name");
      $("#exp_year").removeAttr("name");
      $("#cvc").removeAttr("name");
      $("#charge-form").append(
        $('<input type="hidden" name="payjp-token">').val(response.id)
      );
      $("#charge-form").submit();
    } else {
      alert("カード情報が正しくありません。");
    }
    });
  });
})