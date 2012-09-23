# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.Vector2D
	constructor: ( x, y ) ->
		@x = x ? 0.0
		@y = y ? 0.0

	SetZero: -> 
		@x = 0.0
		@y = 0.0

		return @

	Set: ( x, y ) -> 
		@x = x
		@y = y

		return @

	SetV: ( vector ) -> 
		@x = vector.x
		@y = vector.y

		return @

	Negative: -> 
		new box2d.Vector2D( -@x, -@y )

	Copy: ->
		new box2d.Vector2D( @x, @y )

	Add: ( vector ) ->
		@x += vector.x
		@y += vector.y

		return @

	Subtract: ( v ) ->
		@x -= v.x
		@y -= v.y

		return @

	Multiply: ( scalar ) ->
		@x *= scalar
		@y *= scalar

		return @

