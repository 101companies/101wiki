class Wiki.Models.Implementation extends Backbone.Model
	paramRoot: 'implementation'

	defaults:
		title: null
		categories: []
		headlines: []

	url : () -> 
		"/api/101implementation:" + @get('title')