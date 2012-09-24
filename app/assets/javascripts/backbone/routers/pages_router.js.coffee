class Wiki.Routers.PagesRouter extends Backbone.Router

	routes:
		"edit/:sectionname": "editSection",
		"edit": "edit",
		".*"   : "show"

	# show page
	show: () ->
		@implementation = new Wiki.Models.Implementation(Wiki.context);
		@implementation.set('headlines', $('.mw-headline').map(() -> @id).get())
		@view = new Wiki.Views.Implementations.ShowView({model: @implementation})
		@view.render() 


	# edit page
	edit: () ->
		console.log("Editing")


	# edit a section
	editSection: (sectionname) ->
		console.log("Editing '" + sectionname + "'")