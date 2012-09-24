class Wiki.Routers.PagesRouter extends Backbone.Router

	routes:
		"/edit": "edit"
		".*"   : "show"

	# show an implementation
	show: () ->
		@implementation = new Wiki.Models.Implementation(Wiki.context);
		@view = new Wiki.Views.Implementations.ShowView({model: @implementation})
		@view.render() 

	# edit an implementation
	edit: () ->
		#implementation = @implementations.get(id)
		#@view = new Wiki.Views.Implementations.EditView(model: implementation)
		#$("#main").html(@view.render().el)
