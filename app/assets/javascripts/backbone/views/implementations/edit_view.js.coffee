Wiki.Views.Implementations ||= {}

class Wiki.Views.Implementations.EditView extends Backbone.View
  template : JST["backbone/templates/implementations/edit"]

  events :
    "submit #edit-implementation" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (implementation) =>
        @model = implementation
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
