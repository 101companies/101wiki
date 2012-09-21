class Wiki.Models.Implementation extends Backbone.Model
	paramRoot: 'implementation'

	defaults:
		title: null
		content: null

	url : () -> 
		"http://localhost:3000/api/101implementation:" + @get('title')

	class Wiki.Collections.ImplementationsCollection extends Backbone.Collection
		model: Wiki.Models.Implementation
		url: '/implementations'