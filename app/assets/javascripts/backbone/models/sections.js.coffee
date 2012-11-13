class Wiki.Models.Section extends Backbone.Model

  idAttribute: 'title'

  defaults:
    title: null
    content: null

  urlRoot : -> 
    "/api/pages/" + Wiki.page.get('title') + "/sections/"


class Wiki.Models.Sections extends Backbone.Collection
  model: Wiki.Models.Section