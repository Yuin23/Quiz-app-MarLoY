dispatcher = new WebSocketRails('localhost:3000/websocket')
channel = dispatcher.subscribe 'quizzes'
channel.bind 'new', (quiz) ->
	# alert ('a new quiz was created')
	$('body').prepend $('<h3>', {text: 'New quiz added ' + quiz.title})



# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
