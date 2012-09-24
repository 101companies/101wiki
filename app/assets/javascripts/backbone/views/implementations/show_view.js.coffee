Wiki.Views.Implementations ||= {}

class Wiki.Views.Implementations.ShowView extends Backbone.View
	template: JST["backbone/templates/implementations/show"]

	el: "#main"

	render: ->
		$.each(@model.get('categories'), (i,catname) -> 
			$('#infofooter').prepend(
				$('<a>').attr('href', '#').html(
					$('<span>').addClass('label label-info').text(catname)
				).append(' ')
			)
		)
		#$(@el).html(@template({title: @model.title, content: wiki2html(@model.content)}))