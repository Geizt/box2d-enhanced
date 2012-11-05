# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.BufferedPair
	constructor: ->
		@proxyId1 = 0
		@proxyId2 = 0

	IsValid: ->
		return @proxyId1? && isFinite( @proxyId1 ) && 
			   @proxyId2? && isFinite( @proxyId2 )