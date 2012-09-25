class Wiki.Routers.PagesRouter extends Backbone.Router

	routes:
		"edit/:sectionname": "editSection",
		"edit": "edit",
		".*"   : "show"

	# show page
	show: ->
		Wiki.page.set 'sections', new Wiki.Models.Sections()
		$.each $(".mw-headline"), ->
			section = new Wiki.Models.Section({pagetitle: Wiki.page.get('title'), title: @id})
			Wiki.page.get('sections').add(section) 
		@view = new Wiki.Views.Implementations.ShowView()
		@view.render() 
		Wiki.mainDrawn = true


	# edit page
	edit: ->
		@show() unless Wiki.mainDrawn
		console.log "Editing"


	# edit a section
	editSection: (sectionname) ->
		@show() unless Wiki.mainDrawn
		console.log "Editing '" + sectionname + "'"
		@view = new Wiki.Views.Sections.EditView(model: sectionname)
		@view.render()