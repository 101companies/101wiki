Wiki.Views.Sections ||= {}

class Wiki.Views.Sections extends Backbone.View
  template : JST['backbone/templates/sections/edit']
  ebTemplate: JST['backbone/templates/editbutton'] 

  events: {
    'click .editbutton' : 'edit'
  }

  inEdit: false

  render: ->
    # wrap el in containers for easy access
    @e = $('#' + @model.get('title')).removeAttr("id").parent().wrap('<div></div>').parent().addClass('headlinecontainer').
      append(@ebTemplate(headline:  @model.get('title')))[0]
    $set = $()
    nxt = @e.nextSibling
    while nxt
        unless $(nxt).is('h2')
          $set.push nxt
          nxt = nxt.nextSibling
        else
          break
    $set.wrapAll('<div class="section-content-parsed"/>').
      parent().wrap('<div class="section-content"/>')

    $(@e).next().wrap('<div class="section-content-container"/>').parent().attr("id", @model.get('title'))
    # set el to section wrapping container
    @setElement($(@e).next().andSelf().wrapAll('<div class="section"/>').parent())


  edit: ->
    unless $(@el).find('.section-content-source').length
      $(@el).find('.section-content').append($('<div>').addClass('section-content-source').append(
        $('<div>').attr('id', @model.get('title') + 'editor').addClass('editor')
      ))
    console.log('#' + @model.get('title') + 'form')
    self = @
    @model.fetch(success: (model, res) ->
      console.log(self.model.get('content'))
      #$('#' + self.model.get('title') + 'editor').text(self.model.get('content'))
      editor = ace.edit(self.model.get('title') + 'editor');
      editor.setTheme("ace/theme/chrome");
      editor.getSession().setMode("ace/mode/text");
      editor.insert(self.model.get('content'))
    )
    $(@el).find('.section-content').animate({marginLeft: '-100%'}, 400)
