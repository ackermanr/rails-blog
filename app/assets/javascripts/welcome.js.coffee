# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("div#welcome h1").fadeIn 4000 

  $("#email").click ->
    if $("#hidden-form").hasClass("on")
      $("#hidden-form").removeClass "on"
      $("#hidden-form").slideUp "slow"
    else
      $("#hidden-form").slideDown "slow"
      $("#hidden-form").addClass "on"
