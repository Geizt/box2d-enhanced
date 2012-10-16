# The pair manager is used by the broad-phase to quickly add/remove/find pairs
# of overlapping proxies. It is based closely on code provided by Pierre Terdiman.

# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.Pair
	constructor: ->
		@nullPair = box2d.Settings.USHRT_MAX
		@nullProxy = box2d.Settings.USHRT_MAX
		@tableCapacity = box2d.Settings.maxPairs
		@tableMask = @tableCapacity - 1
		@pairBuffered = 0x0001
		@pairRemoved = 0x0002
		@pairFinal = 0x0004
		@userData = null
		@proxyId1 = 0
		@proxyId2 = 0
		@next = 0
		@status = 0

	SetBuffered: ->
		@status |= @pairBuffered

		return @

	ClearBuffered: ->
		@status &= ~@pairBuffered

		return @

	IsBuffered: ->
		return ( @status & @pairBuffered ) is @pairBuffered

	SetRemoved: ->
		@status |= @pairRemoved

		return @

	ClearRemoved: ->
		@status &= ~@pairRemoved

		return @

	IsRemoved: ->
		return ( @status & @pairRemoved ) is @pairRemoved

	SetFinal: ->
		@status |= @pairFinal

		return @

	IsFinal: ->
		return ( @status & @pairFinal ) is @pairFinal