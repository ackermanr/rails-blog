# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $("#home-button").slideDown "slow"

  $("#contact-form").click ->
    $("#hidden-form").slideToggle "slow"

$(document).ready(ready)
$(document).on('page:load', ready)
