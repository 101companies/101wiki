Wiki.Views.Sections ||= {}

class Wiki.Views.Sections extends Backbone.View
  template : JST['backbone/templates/sections/edit']
  ebTemplate: JST['backbone/templates/editbutton'] 

  render: ->
    self = @
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

    $(@el).find('.editbutton').toggle(
      -> 
        $(@).find('strong').text("Save")
        self.edit()
      ,
      -> 
        $(@).find('strong').text("Edit")
        self.save()
    )

  edit: ->
    self = @
    unless $(@el).find('.section-content-source').length
      $(@el).find('.section-content').append($('<div>').addClass('section-content-source').append(
        $('<div>').attr('id', @model.get('title') + 'editor').addClass('editor')
      ))    
    @model.fetch(success: (model, res) ->
      self.editor = ace.edit(self.model.get('title') + 'editor');
      self.editor.setTheme("ace/theme/chrome");
      self.editor.getSession().setMode("ace/mode/text");
      self.editor.insert(self.model.get('content'))
    )
    $(@el).find('.section-content').animate({marginLeft: '-100%'}, 400)


  save: ->
    @model.save(content: @editor.getValue(), 
      success: -> console.log("Worked"), 
      error: -> console.log("Error")
    )
