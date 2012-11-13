Wiki.Views.Sections ||= {}

class Wiki.Views.Sections extends Backbone.View
  template : JST['backbone/templates/section']
  ebTemplate: JST['backbone/templates/editbutton'] 

  render: ->
    self = @
    # get prerendered headline node
    preRendered = $('#' + @model.get('title')).parent()

    # collect prerendered content nodes
    $set = $()
    nxt = preRendered[0].nextSibling
    while nxt
        unless $(nxt).is('h2')
          $set.push nxt
          nxt = nxt.nextSibling
        else
          break

    # replace prerendered section by template      
    $section = $(@template(title: @model.get('title')))
    $section.find('.section-content-parsed').append($set)
    preRendered.after($section).remove()
    @setElement($section)

    # set handler
    $(@el).find('.editbutton').click( -> self.edit(@))

  edit: (button) ->
    self = @
    @toggleEdit(true)
    self.editor = ace.edit($(self.el).find('.editor')[0]);
    self.editor.setTheme("ace/theme/chrome");
    self.editor.getSession().setMode("ace/mode/text");
    self.editor.insert(self.model.get('content'))
    $(button).find('strong').text("Save")
    $(button).unbind('click').bind('click', -> self.save(button))
    
  save: (button) ->
    @model.save(content: @editor.getValue(), 
      success: -> 
        console.log("Success")
      , 
      error: (a,b) -> 
        console.log("Error " + b.status)
    )

  toggleEdit: (open) ->
    if open
      $(@el).find('.section-content').animate({marginLeft: '-100%'}, 400)
      $(@el).find('.section-content-source').css(height: '400px')
      $(@el).find('.editor').css(height: '400px')
    else
      console.log("foo")
