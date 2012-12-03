class Wiki.Views.Categories extends Wiki.Views.Pages

  render: ->
    @.constructor.__super__.render.apply(@);
    # add backlinks
    $.each @model.get('members'), (i,m) ->
      $('#members').append(
        $('<a>').attr('href', '/' + m.replace(' ', '_')).html(
           $('<p>').html($('<span>').addClass('label').text(m))
        ).append(' ')
      )
