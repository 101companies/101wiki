class Wiki.Models.Section extends Backbone.Model

	defaults:
		title: null
		pagetitle: null
		content: null

	url : () -> 
		'/api/sections/' + @get('title') # actual call to be supported: "/api/pages/" + @get('title') + "/sections/" + @get('headlinetitle')


class Wiki.Models.Sections extends Backbone.Collection
		model: Wiki.Models.Section