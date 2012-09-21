class Wiki.Models.Implementation extends Backbone.Model
  paramRoot: 'implementation'

  defaults:
    title: null
    content: null

class Wiki.Collections.ImplementationsCollection extends Backbone.Collection
  model: Wiki.Models.Implementation
  url: '/implementations'
