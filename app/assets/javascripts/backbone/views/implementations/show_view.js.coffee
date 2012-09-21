Wiki.Views.Implementations ||= {}

class Wiki.Views.Implementations.ShowView extends Backbone.View
  template: JST["backbone/templates/implementations/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
