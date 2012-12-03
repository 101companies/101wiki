class Wiki.Models.Category extends Wiki.Models.Page

  defaults: _.extend({},Wiki.Models.Page.prototype.defaults,
         members: []
  )
