class Wiki.Views.Pages extends Backbone.View

  initialize: ->
    @model.get('sections').bind('add', @addSection, @)
    @model.bind('change', @render, @)
    @model.get('sections').bind('change', @saveSectionEdit, @)

    @render()
    @addAllSections()

  el: "#page"


  render: ->
    # add page title
    $("#title h1").text(@model.get('title'))

    # modal
    $(document).ajaxComplete((event, res, settings) -> 
      unless res.status == 200
        $('#modal_content').css('color', 'red').text("Something went wrong: " + res.statusText)
      else
        $('#modal_content').css('color', 'green').text("Done!")
        setTimeout(
          -> $('#modal').modal('hide'),
          500
        )
    )
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


  saveSectionEdit: -> 
    $('#modal_content').css('color', 'black').text("Saving page...")
    $('#modal').modal()
    @model.save()

