class Wiki.Routers.ImplementationsRouter extends Backbone.Router

	routes:
		"/edit": "edit"
		".*"   : "show"

	# show an implementation
	show: () ->
		console.log("Showing 101implementation '" + Wiki.page + "'")
		@implementation = new Wiki.Models.Implementation({title: Wiki.page});
		@implementation.fetch({
			success: (res,data) -> 
					@view = new Wiki.Views.Implementations.ShowView({model: data})
					@view.render()
			})  

	# edit an implementation
	edit: () ->
		#implementation = @implementations.get(id)
		#@view = new Wiki.Views.Implementations.EditView(model: implementation)
		#$("#main").html(@view.render().el)
