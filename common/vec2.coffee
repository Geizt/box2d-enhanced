# Create a namespace to export public methods
box2d: exports? and exports or @box2d = {}

class box2d.Vec2
	constructor: ( x, y ) ->
		@x = x ? 0.0
		@y = y ? 0.0

	SetZero: -> 
		@x = 0.0
		@y = 0.0

		return

	Set: ( x, y ) -> 
		@x = x
		@y = y

		return

	SetV: ( v ) -> 
		@x = v.x
		@y = v.y

		return

	Negative: -> 
		new box2d.Vec2( -@x, -@y )

	Copy: ->
		new box2d.Vec2( @x, @y )

	Add: ( v ) ->
		@x += v.x
		@y += v.y

		return

	Subtract: ( v ) ->
		@x -= v.x
		@y -= v.y

		return

	Multiply: ( a ) ->
		@x *= a
		@y *= a

		return