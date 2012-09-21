Wiki.Views.Implementations ||= {}

class Wiki.Views.Implementations.NewView extends Backbone.View
  template: JST["backbone/templates/implementations/new"]

  events:
    "submit #new-implementation": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (implementation) =>
        @model = implementation
        window.location.hash = "/#{@model.id}"

      error: (implementation, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
