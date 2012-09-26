class Wiki.Models.Implementation extends Backbone.Model

	defaults:
		title: null
		categories: []
		sections: null

	url : () -> 
		"/api/101implementation:" + @get('title')