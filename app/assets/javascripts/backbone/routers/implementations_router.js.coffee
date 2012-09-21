class Wiki.Routers.ImplementationsRouter extends Backbone.Router
  initialize: (options) ->
    @implementations = new Wiki.Collections.ImplementationsCollection()
    @implementations.reset options.implementations

  routes:
    "/new"      : "newImplementation"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newImplementation: ->
    @view = new Wiki.Views.Implementations.NewView(collection: @implementations)
    alert("")
    $("#main").html(@view.render().el)

  index: ->
    @view = new Wiki.Views.Implementations.IndexView(implementations: @implementations)
    $("#main").html(@view.render().el)

  show: (id) ->
    implementation = @implementations.get(id)
    console.log(id)
    @view = new Wiki.Views.Implementations.ShowView(model: implementation)
    $("#main").html(@view.render().el)

  edit: (id) ->
    implementation = @implementations.get(id)

    @view = new Wiki.Views.Implementations.EditView(model: implementation)
    $("#main").html(@view.render().el)
