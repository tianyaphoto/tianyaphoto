$ ->
	$(".close").click ->
		$(this).parent().fadeTo('normal', 0)?.hide()
