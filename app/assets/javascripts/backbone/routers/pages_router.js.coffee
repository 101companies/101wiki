class Wiki.Routers.PagesRouter extends Backbone.Router

	routes:
		".*"   : "show"

	# show page
	show: ->
		Wiki.page.set 'sections', new Wiki.Models.Sections()
		$.each $(".mw-headline"), ->
			section = new Wiki.Models.Section({title: @id})
			Wiki.page.get('sections').add(section)
			sectionview = new Wiki.Views.Sections(model: section, el: @)
			sectionview.render()
		appview = new Wiki.Views.Pages()
		appview.render() 
		Wiki.mainDrawn = true