class Wiki.Models.Implementation extends Backbone.Model
	paramRoot: 'implementation'

	defaults:
		title: null
		categories: []
		headlines: []

	url : () -> 
		"/api/101implementation:" + @get('title')

	class Wiki.Collections.ImplementationsCollection extends Backbone.Collection
		model: Wiki.Models.Implementation
		url: '/implementations'