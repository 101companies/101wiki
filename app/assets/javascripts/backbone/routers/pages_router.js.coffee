class Wiki.Routers.PagesRouter extends Backbone.Router

	routes:
		"edit/:sectionname": "editSection",
		"edit": "edit",
		".*"   : "show"

	# show page
	show: ->
		Wiki.page.set "headlines", $(".mw-headline").map(-> @id).get()
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