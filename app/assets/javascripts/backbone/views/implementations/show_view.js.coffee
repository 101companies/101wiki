Wiki.Views.Implementations ||= {}

class Wiki.Views.Implementations.ShowView extends Backbone.View
	template: JST["backbone/templates/implementations/show"]
	# template for edit button
	ebTemplate: JST["backbone/templates/editbutton"] 

	el: "#main"

	render: ->
		console.log 'Rendering...'
		$('.container').prepend('<hr>').prepend($('<h1>').text(Wiki.page.get('title')))

		# add category links
		$.each Wiki.page.get('categories'), (i,catname) -> 
			$('#infofooter').prepend(
				$('<a>').attr('href', 'Category:' + catname.replace(' ', '_')).html(
					$('<span>').addClass('label label-info').text(catname)
				).append(' ')
			)

		self = @
		# edit sections buttons
		$.each Wiki.page.get("headlines"), (i, headline) ->
			$("#" + headline).parent().wrap("<div></div>").parent().addClass("headlinecontainer").
				append self.ebTemplate(headline: headline)



		# remove TOC
		$('#toc').remove()

		# wrap contents of sections
		$('.container .headlinecontainer').each ->
			$set = $()
			nxt = @nextSibling
			while nxt
				unless $(nxt).is('.container .headlinecontainer')
					$set.push nxt
					nxt = nxt.nextSibling
				else
					break
			$set.wrapAll('<div class="section-content-source"/>').parent().wrap('<div class="section-content"/>')

