class Wiki.Views.Pages extends Backbone.View

  initialize: ->
    @model.get('sections').on('add', @addOne)


  render: ->
    # add page title
    $('.container').prepend('<hr>').prepend($('<h1>').text(@model.get('title')))

    # add category links
    $.each @model.get('categories'), (i,catname) -> 
      $('#infofooter').prepend(
        $('<a>').attr('href', 'Category:' + catname.replace(' ', '_')).html(
          $('<span>').addClass('label label-info').text(catname)
        ).append(' ')
      )

    # remove TOC
    $('#toc').remove()

  addOne: (section) ->
      sectionview = new Wiki.Views.Sections(model: section, el: @)
      sectionview.render()