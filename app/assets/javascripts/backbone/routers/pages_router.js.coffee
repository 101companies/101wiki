class Wiki.Routers.PagesRouter extends Backbone.Router
	routes:
		"explorer" : "explorerTab"
		"*actions" : "wikiTab"


	initialize: ->
		console.log(Wiki.page.toJSON())
		# Change hash when a tab changes
		$('a[data-toggle="tab"]').on 'shown', (e) -> 
		  location.href = event.target.href

	# show page with wiki view
	wikiTab: (x) ->
		console.log("Wiki view selected")
		new Wiki.Views.Pages(model: Wiki.page)

	# show page with explorer view
	explorerTab: (x) ->
		console.log("Explorer view selected")