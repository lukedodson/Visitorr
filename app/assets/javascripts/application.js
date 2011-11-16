// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(function() {
  $("#credit-card input, #credit-card select").attr("disabled", false);

  $("form:has(#credit-card)").submit(function() {
    var form = this;
    $("#user_submit").attr("disabled", true);
    $("#credit-card input, #credit-card select").attr("name", "");
    $("#credit-card-errors").hide();

    if (!$("#credit-card").is(":visible")) {
      $("#credit-card input, #credit-card select").attr("disabled", true);
      return true;
    }
    
    var card = {
      number:   $("#credit_card_number").val(),
      expMonth: $("#_expiry_date_2i").val(),
      expYear:  $("#_expiry_date_1i").val(),
      cvc:      $("#cvv").val()
    };


    Stripe.createToken(card, function(status, response) {
      if (status === 200) {
        $("#user_last_4_digits").val(response.card.last4);
        $("#user_stripe_token").val(response.id);
        form.submit();
      } else {
        $("#stripe-error-message").text(response.error.message);
        $("#credit-card-errors").show();
        $("#user_submit").attr("disabled", false);
      }
    });

    return false;
  });

  $("#change-card a").click(function() {
    $("#change-card").hide();
    $("#credit-card").show();
    $("#credit_card_number").focus();
    return false;
  });
});
