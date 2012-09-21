Wiki.Views.Implementations ||= {}

class Wiki.Views.Implementations.IndexView extends Backbone.View
  template: JST["backbone/templates/implementations/index"]

  initialize: () ->
    @options.implementations.bind('reset', @addAll)

  addAll: () =>
    @options.implementations.each(@addOne)

  addOne: (implementation) =>
    console.log(implementation)
    view = new Wiki.Views.Implementations.ImplementationView({model : implementation})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(implementations: @options.implementations.toJSON() ))
    @addAll()

    return this
  