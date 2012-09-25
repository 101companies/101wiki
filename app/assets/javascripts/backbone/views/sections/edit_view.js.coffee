Wiki.Views.Sections ||= {}

class Wiki.Views.Sections.EditView extends Backbone.View
  template : JST["backbone/templates/sections/edit"]

  render : ->
    console.log @m
    $('#' + @sectionname).text("FOO")

    return this
