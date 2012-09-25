class Wiki.Models.Implementation extends Backbone.Model
	paramRoot: 'implementation'

	defaults:
		title: null
		categories: []
		sections: null

	url : () -> 
		"/api/101implementation:" + @get('title')