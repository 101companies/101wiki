class Wiki.Models.Section extends Backbone.Model

  idAttribute: 'title'

  defaults:
    title: null
    page: null;
    content: null

  urlRoot : -> 
    "/api/pages/" + @get('page').get('title') + "/sections/"

  toJSON: ->
    {title: @get('title'), content: @get('content')}


class Wiki.Models.Sections extends Backbone.Collection
  model: Wiki.Models.Section