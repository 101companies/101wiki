Wiki.Views.Implementations ||= {}

class Wiki.Views.Pages extends Backbone.View

  render: ->
    # add page title
    $('.container').prepend('<hr>').prepend($('<h1>').text(Wiki.page.get('title')))

    # add category links
    $.each Wiki.page.get('categories'), (i,catname) -> 
      $('#infofooter').prepend(
        $('<a>').attr('href', 'Category:' + catname.replace(' ', '_')).html(
          $('<span>').addClass('label label-info').text(catname)
        ).append(' ')
      )

    # remove TOC
    $('#toc').remove()