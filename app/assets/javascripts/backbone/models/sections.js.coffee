class Wiki.Models.Section extends Backbone.Model

  defaults:
    title: null
    page: null;
    content: null

  url : -> 
    "/api/pages/" + Wiki.page.get('title') + "/sections/" + @get('title')


class Wiki.Models.Sections extends Backbone.Collection
  model: Wiki.Models.Section