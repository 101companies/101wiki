class Wiki.Models.Implementation extends Backbone.Model

  idAttribute: 'title'

  defaults:
    title: null
    categories: []
    sections: null
                      
  urlRoot : -> 
    "/api/pages"