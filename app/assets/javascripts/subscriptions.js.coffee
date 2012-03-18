# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  user.setupForm()

user =
  setupForm: ->
    $("#pay_with_paypal").click ->
      $("#paypal_checkout").show()
      $("#billing_fields").hide()
      $(".actions").hide()
      true

    $("#pay_with_card").click ->
      $("#paypal_checkout").hide()
      $("#billing_fields").show()
      $(".actions").show()
      true
    
    $('#new_user').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        user.processCard()
        false
      else
        true
  
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, user.handleStripeResponse)
  
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#user_stripe_card_token').val(response.id)
      $('#new_user')[0].submit()
    else
      $('#stripe-error-message.alert-message.block-message.error').text(response.status)
      $('input[type=submit]').attr('disabled', false)
      
$("#change-card a").click ->
   $("#change-card").hide()
   $("#credit-card").show()
   $("#credit_card_number").focus()
   false
      
