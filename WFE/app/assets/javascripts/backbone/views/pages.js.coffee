class Wiki.Views.Pages extends Backbone.View

  el: "#page"

  initialize: ->
    @model.get('sections').bind('add', @addSection, @)
    @model.bind('change', @render, @)
    @model.get('sections').bind('change', @saveSectionEdit, @)

    @render()
    @addAllSections()

  render: ->
    console.log(@model.get('backlinks'))
    # add page title
    $("#title h1").text(@model.get('title'))

    # modal for completed ajax
    $(document).ajaxComplete((event, res, settings) ->
      unless res.status == 200
        $('#modal_body').html(
          $('<div>').addClass('alert alert-error')
          .text("Something went wrong: " + res.statusText))
      else
        $('#modal_body').html(
          $('<div>').addClass('alert alert-success')
          .text('Done'))
        setTimeout(
          -> $('#modal').modal('hide'),
          500
        )
    )

    # add backlinks
    $.each @model.get('backlinks'), (i,bl) ->
      $('#backlinks').append(
        $('<a>').attr('href', '/' + bl.replace(' ', '_')).html(
           $('<p>').html($('<span>').addClass('label').text(bl))
        ).append(' ')
      )
    #backlinks = for bl in @model.get('backlinks')
     # listitem = new Wiki.Models.ListItem(title: bl)
     # (new Wiki.Views.ListItems(model: listitem)).render()
    #$('#backlinks').append(backlinks)

    # add category links
    $.each @model.get('categories'), (i,catname) ->
      $('#categories').append(
        $('<a>').attr('href', '/Category:' + catname.replace(' ', '_')).html(
           $('<p>').html($('<span>').addClass('label').text(catname))
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
    $('#modal_body').html(
          $('<div>').addClass('alert alert-info')
          .text("Saving page..."))
    $('#modal').modal()
    @model.save()

  foo: ->
    alert("yes")

