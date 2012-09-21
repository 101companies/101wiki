Wiki.Views.Implementations ||= {}

class Wiki.Views.Implementations.ShowView extends Backbone.View
	template: JST["backbone/templates/implementations/show"]

	el: "#main"

	render: ->
		$(@el).html(@template(@model))