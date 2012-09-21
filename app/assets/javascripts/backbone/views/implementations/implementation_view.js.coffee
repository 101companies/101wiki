Wiki.Views.Implementations ||= {}

class Wiki.Views.Implementations.ImplementationView extends Backbone.View
  template: JST["backbone/templates/implementations/implementation"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  className: "info"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
