# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

activeItem = null

$('.course').hover (event) ->
		$(this).toggleClass("hover")

jQuery ->
  $('#event_due_date').datepicker
    dateFormat: 'yy-mm-dd'

$ ->
	$("#courselist li").click ->
		toggleDetailsDisplay(this)

toggleDetailsDisplay = (listItem) ->
	console.log("hello")

	$(".course-details").slideIp()

	if activeItem == listItem
    	activeItem = null
         
    $(listItem).find(".course-details").slideDown()
        
    activeItem = listItem;