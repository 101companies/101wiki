class Wiki.Routers.PagesRouter extends Backbone.Router

	routes:
		"edit/:sectionname": "editSection",
		"edit": "edit",
		".*"   : "show"

	# show page
	show: () ->
		Wiki.page.set('headlines', $('.mw-headline').map(() -> @id).get())
		@view = new Wiki.Views.Implementations.ShowView()
		@view.render() 
		Wiki.mainDrawn = true


	# edit page
	edit: () ->
		if (!Wiki.mainDrawn)
			@show()
		console.log("Editing")


	# edit a section
	editSection: (sectionname) ->
		if (!Wiki.mainDrawn)
			@show()
		console.log("Editing '" + sectionname + "'")