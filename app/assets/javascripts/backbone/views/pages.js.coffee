class Wiki.Views.Pages extends Backbone.View

  initialize: ->
    @model.get('sections').bind('add', @addSection, @)
    @model.bind('change', @render, @)
    @render()
    @addAllSections()

  el: "#page"

  render: ->
    # add page title
    #

    # add category links
    $.each @model.get('categories'), (i,catname) -> 
      $('#infofooter').prepend(
        $('<a>').attr('href', 'Category:' + catname.replace(' ', '_')).html(
          $('<span>').addClass('label label-info').text(catname)
        ).append(' ')
      )

    # remove TOC
    $('#toc').remove()  


  addSection: (section) ->
      sectionview = new Wiki.Views.Sections(model: section)
      sectionview.render()

  addAllSections: ->
    self = @
    $.each @model.get('sections').models , (i, section) -> self.addSection(section)

