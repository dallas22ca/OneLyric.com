$ ->
	topNav.events()

@Dashboard =
	thing: ->
		# coo

@topNav =
	events: ->
		$(".meta_nav").on "click", "a", ->
			tag = $(this).data("tag")
			$("#meta_nav a.selected").removeClass("selected")
			$(this).addClass("selected")
			$(".frame:visible").find("[data-tag]").removeClass("selected")
			$(".frame:visible").find("[data-tag='#{tag}']").addClass("selected")
			false

		$("#topnav").on "click", "a", ->
			select = true
			action = $(this).attr("data-action")
			toggle = $(this).attr("data-toggle")
			
			if typeof toggle != "undefined"
				select = false
				$(this).attr "data-toggle", if toggle == "on" then "off" else "on"
			else if action == "black"
				$(".frame").removeClass "show"
			else if action == "lyrics"
				unless $("#lyrics").hasClass "show"
					$(".frame").removeClass "show"
					$("#lyrics").addClass "show"
			else if action == "home"
				unless $("#home").hasClass "show"
					$(".frame").removeClass "show"
					$("#home").addClass "show"
			else if action == "music"
				unless $("#music").hasClass "show"
					$(".frame").removeClass "show"
					$("#music").addClass "show"
			else
				select = true

			if select
				$("#topnav a.selected").removeClass "selected"
				$(this).addClass "selected"
			false