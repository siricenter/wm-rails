# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
checkAvailability = (building) ->
	semesterId = $('#semester').val()
	if building == 'mens'
		building_id = 1
	if building == 'womens'
		building_id = 2
	$.get "/buildings/#{building_id}/availability/#{semesterId}", {}, (data) ->
		if (data.available) 
			available()
		else
			unavailable()

$(document).ready ->
	$('#mens').on('click', () ->
		checkAvailability('mens'))
	$('#womens').on('click', () ->
		checkAvailability('womens'))

available = (data) ->
	$('#available-answer').addClass('success').hide().fadeIn()
	$('#available-answer').children().first().text('Available: Book Now!')

unavailable = (data) ->
	window.alert 'unavailable'
	$('#available-answer').addClass('failure').hide().fadeIn()
	$('#available-answer').children().first().text('Available: Book Now!')
