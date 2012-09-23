# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.Vector2D
	constructor: ( x, y ) ->
		if x != null and isNaN( x ) or y != null and isNaN( y )
			throw new TypeError
		else
			@x = x ? 0.0
			@y = y ? 0.0

	SetZero: -> 
		@x = 0.0
		@y = 0.0

		return @

	Set: ( x, y ) -> 
		if isNaN( x ) or isNaN( y )
			throw new TypeError
		else
			@x = x
			@y = y

		return @

	SetV: ( vector ) -> 
		if vector == null or isNaN( vector.x ) or isNaN( vector.y )
			throw new TypeError
		else
			@x = vector.x
			@y = vector.y

		return @

	Negative: -> 
		new box2d.Vector2D( -@x, -@y )

	Copy: ->
		new box2d.Vector2D( @x, @y )

	Add: ( vector ) ->
		if vector == null or isNaN( vector.x ) or isNaN( vector.y )
			throw new TypeError
		else
			@x += vector.x
			@y += vector.y

		return @

	Subtract: ( vector ) ->
		if vector == null or isNaN( vector.x ) or isNaN( vector.y )
			throw new TypeError
		else
			@x -= vector.x
			@y -= vector.y

		return @

	Multiply: ( scalar ) ->
		if vector == null or isNaN( scalar )
			throw new TypeError
		else
			@x *= scalar
			@y *= scalar

		return @