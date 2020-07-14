$(document).on('turbolinks:load', (function () {
  $('.SellMainFormContainer__price__number').on('keyup', function(){
    var data = $(this).val();
    var profit = Math.round(data * 0.9)
    var fee = (data - profit)
    $('.SellMainFormContainer__tax__bar').html(fee)
    $('.SellMainFormContainer__tax__bar').prepend('¥')
    $('.SellMainFormContainer__tax__bottom').html(profit)
    $('.SellMainFormContainer__tax__bottom').prepend('¥')
    $('#price').val(profit)
    if(profit == '') {
      $('.SellMainFormContainer__tax__bottom').html('');
      $('.SellMainFormContainer__tax__bar').html('');
    }
  })
}))