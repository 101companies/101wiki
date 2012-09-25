class Wiki.Models.Section extends Backbone.Model
	paramRoot: 'implementation'

	defaults:
		title: null
		pagetitle: null
		content: []

	url : () -> 
		"/api/pages/" + @get('title') + "/sections/" + @get('headlinetitle')


class Wiki.Models.Sections extends Backbone.Collection
    model: Wiki.Models.Section