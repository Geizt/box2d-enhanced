# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.Bound
	constructor: ->
		@value = 0
		@proxyId = 0
		@stabbingCount = 0

	IsValid: ->
		return @value? && isFinite( @value ) && 
			   @proxyId? && isFinite( @proxyId ) && 
			   @stabbingCount? && isFinite( @stabbingCount )

	IsLower: ->
		return ( @value & 0x01 ) == 0

	IsUpper: ->
		return ( @value & 0x01 ) == 1

	Swap: ( bound ) ->
		if not ( bound.value? and bound.proxyId? and bound.stabbingCount? )
			throw new TypeError

		tmpValue = @value
		tmpProxyId = @proxyId
		tmpStabbingCount = @stabbingCount

		@value = bound.value
		@proxyId = bound.proxyId
		@stabbingCount = bound.stabbingCount

		bound.value = tmpValue
		bound.proxyId = tmpProxyId
		bound.stabbingCount = tmpStabbingCount
		
		return