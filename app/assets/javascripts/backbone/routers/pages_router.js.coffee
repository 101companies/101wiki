class Wiki.Routers.PagesRouter extends Backbone.Router

	routes:
		".*"   : "show"

	# show page
	show: ->
		Wiki.page.set 'sections', new Wiki.Models.Sections()
		appview = new Wiki.Views.Pages(model: Wiki.page)
		appview.render() 
		$.each $(".mw-headline"), ->
			section = new Wiki.Models.Section({title: @id, page: Wiki.page})
			Wiki.page.get('sections').add(section)