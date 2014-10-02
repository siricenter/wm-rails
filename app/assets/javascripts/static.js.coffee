# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
checkAvailability = (building) ->
	$('#available-answer').fadeOut()
	semesterId = $('#sem-select').val()
	if building == 'mens'
		buildingId = 1
	if building == 'womens'
		buildingId = 2
	$.get "/buildings/#{buildingId}/availability/#{semesterId}", {}, (data) ->
		if (data.available) 
			available(buildingId)
		else
			unavailable()

$(document).ready ->
	$('#mens').on('click', () ->
		checkAvailability('mens'))
	$('#womens').on('click', () ->
		checkAvailability('womens'))

available = (buildingId) ->
	view = $('#available-answer')
	semesterId = $('#sem-select').val()
	view.children().first().text('Available: Click Here to Book Now!')
	view.addClass('success').hide().fadeIn()
	view.on 'click', () ->
		window.location = "/choose/#{semesterId}/#{buildingId}"

unavailable = (data) ->
	$('#available-answer').children().first().text('Sorry - We\'re booked!')
	$('#available-answer').addClass('failure').hide().fadeIn()
