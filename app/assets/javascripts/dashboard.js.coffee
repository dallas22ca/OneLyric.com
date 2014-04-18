@OneLyric =
	mode: "lyrics"

	init: ->
		params = window.location.hash.split("/")
		
		for song in OneLyric.songs
			song.mode = OneLyric.mode
			template = $.trim $("template[for='song_li']").html()
			$("#songs").append Mustache.render template, song

$(document).on "click", "[data-toggle]", ->
	$(this).attr "data-toggle", if $(this).attr("data-toggle") == "on" then "off" else "on"

$(document).on "click", "[data-action]", ->
	action = $(this).data("action")
	
	if action == "music"
		OneLyric.mode = if OneLyric.mode == "lyrics" then "music" else "lyrics"
	
	$(window).trigger "hashchange"
	false

$(window).on "hashchange", ->
	params = window.location.hash.split("/")
	
	if params[1] == "songs"
		song = _.findWhere OneLyric.songs,
			permalink: params[2]
		
		if !song
			console.log "Can't find song."
		else
			song.mode = OneLyric.mode
			template = $.trim $("template[for='song']").html()
			$("#song_wrapper").html Mustache.render template, song
			$(".frame.selected").removeClass "selected"
			$("#song_wrapper").find(".#{OneLyric.mode}.frame").addClass "selected"
			$("h1").text song.name
			$("[data-tag]").hide()
			$("[data-tag='#{params[3]}']").show()
			$("[data-tagger='#{params[3]}']").addClass("selected")
		false

$ ->
	OneLyric.init()
	$(window).trigger "hashchange"
		
songs = [
		name: "Shout to the Lord"
		permalink: "shout-to-the-lord"
		lyrics: [
				tag: "c"
				content: "Shout to the Lord..."
			,
				tag: "v1"
				content: "My Jesus, My Saviour..."
			,
				tag: "b"
				content: "Mountains bow down..."
		]
		chords: [
				tag: "c"
				content: "<span class=\"chords\">jhhj	F</span>\n<span class=\"lyrics\">This is the air I breathe</span>\n<span class=\"chords\">C	G		Am	F</span>\n<span class=\"lyrics\">This is the air I breathe</span>\n<span class=\"chords\">C	F</span>\n<span class=\"lyrics\">Your very Word</span>\n<span class=\"chords\">Cm		F</span>\n<span class=\"lyrics\">Spoken to me</span>"
			,
				tag: "v1"
				content: "<span class=\"chords\">C	jm	F</span>\n<span class=\"lyrics\">My Jesus, My Saviour</span>\n<span class=\"chords\">C	G		Am	F</span>\n<span class=\"lyrics\">This is the air I breathe</span>\n<span class=\"chords\">C	F</span>\n<span class=\"lyrics\">Your very Word</span>\n<span class=\"chords\">Cm		F</span>\n<span class=\"lyrics\">Spoken to me</span>"
			,
				tag: "b"
				content: "<span class=\"chords\">C	jhkhj	Am	F</span>\n<span class=\"lyrics\">This is the air I breathe</span>\n<span class=\"chords\">C	G		Am	F</span>\n<span class=\"lyrics\">This is the air I breathe</span>\n<span class=\"chords\">C	F</span>\n<span class=\"lyrics\">Your very Word</span>\n<span class=\"chords\">Cm		F</span>\n<span class=\"lyrics\">Spoken to me</span>"
		]
	,
		name: "All in All"
		permalink: "all-in-all"
		lyrics: [
				tag: "c"
				content: "All in All..."
			,
				tag: "v1"
				content: "You are my strength..."
		]
		chords: [
				tag: "c"
				content: "<span class=\"chords\">C	G		Am	F</span>\n<span class=\"lyrics\">This is the air I breathe</span>\n<span class=\"chords\">C	G		Am	F</span>\n<span class=\"lyrics\">This is the air I breathe</span>\n<span class=\"chords\">C	F</span>\n<span class=\"lyrics\">Your very Word</span>\n<span class=\"chords\">Cm		F</span>\n<span class=\"lyrics\">Spoken to me</span>"
			,
				tag: "v1"
				content: "<span class=\"chords\">A	G		Am	F</span>\n<span class=\"lyrics\">Let's sing it out</span>"
		]
]

@OneLyric.songs = songs