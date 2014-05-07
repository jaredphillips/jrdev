# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(".sub-header").hover (->
  $(this).show "span.credits"
  return
), ->
  $(this).find("span:last").remove()
  return
