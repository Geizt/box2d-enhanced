# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.BoundValues
	constructor: ->
		@lowerValues = [ 0, 0 ]
		@upperValues = [ 0, 0 ]