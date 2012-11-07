class Wiki.Routers.PagesRouter extends Backbone.Router

	routes:
		".*"   : "show"

	# show page
	show: ->

		appview = new Wiki.Views.Pages(model: Wiki.page)
		appview.render() 
		$.each Wiki.page.get('sections').models, (i, section) ->
			sectionview = new Wiki.Views.Sections(model: section)
			sectionview.render()