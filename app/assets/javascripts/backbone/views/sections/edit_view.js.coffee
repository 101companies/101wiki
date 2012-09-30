Wiki.Views.Sections ||= {}

class Wiki.Views.Sections.EditView extends Backbone.View
  template : JST["backbone/templates/sections/edit"]

  render : ->
    $('#' + @model.get('title')).closest('.headlinecontainer').next().children(0).append($('<div>').addClass('section-content-source').append(
    	$('<textarea>').attr('id', @model.get('title') + 'form').text("Loading...")
    ))
    self = @
    @model.fetch(success: (model, res) ->
        $('#' + self.model.get('title') + 'form').text(self.model.get('content'))
    )
    $('#' + @model.get('title')).closest('.headlinecontainer').next().children(0).animate({marginLeft: '-100%'}, 400)

    return this
