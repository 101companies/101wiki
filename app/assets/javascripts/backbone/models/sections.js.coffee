class Wiki.Models.Section extends Backbone.Model

	defaults:
		title: null
		content: null

	url : () -> 
		"/api/pages/" + @get('title') + "/sections/" + @get('title')


class Wiki.Models.Sections extends Backbone.Collection
	model: Wiki.Models.Section