page = 1
ajax_get_data = ->
	page++
	$.get("/welcome/index?page="+page, (data) ->
	  $res = $(data).find(".pane")
	  $("#content").append($res).masonry("appended", $res)
	,"html")

$ ->
	$(".close").click ->
		$(this).parent().fadeTo('normal', 0)?.hide()

	$(window).bind "scroll", () ->
		if typeof(ajax_load) != 'undefined' && ajax_load == true && $(document).scrollTop() + $(window).height() > $(document).height() - 20
		  ajax_get_data()
