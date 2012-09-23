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
		if scalar == null or isNaN( scalar )
			throw new TypeError
		else
			@x *= scalar
			@y *= scalar

		return @

	MulM: ( matrix ) ->
		if matrix == null or isNaN( matrix.col1.x ) or isNaN( matrix.col1.y ) or isNaN( matrix.col2.x ) or isNaN( matrix.col2.y )
			throw new TypeError
		else
			tX = @.x;

			@.x = matrix.col1.x * tX + matrix.col2.x * @.y;
			@.y = matrix.col1.y * tX + matrix.col2.y * @.y;

		return @
	
	MulTM: ( matrix ) ->
		if matrix == null or isNaN( matrix.col1.x ) or isNaN( matrix.col1.y ) or isNaN( matrix.col2.x ) or isNaN( matrix.col2.y )
			throw new TypeError
		else
			tX = box2d.Math.Dot( @, matrix.col1 )

			@.y = box2d.Math.Dot( @, matrix.col2 );
			@.x = tX;

		return @

	CrossVF: ( scalar ) ->
		if scalar == null or isNaN( scalar )
			throw new TypeError
		else
			tX = @.x

			@.x = scalar * @.y
			@.y = -scalar * tX

		return @

	CrossFV: ( scalar ) ->
		if scalar == null or isNaN( scalar )
			throw new TypeError
		else
			tX = @.x

			@.x = -scalar * @.y
			@.y = scalar * tX

		return @

	MinV: ( vector ) ->
		if vector == null or isNaN( vector.x ) or isNaN( vector.y )
			throw new TypeError
		else
			@.x = if @.x < vector.x then @.x else vector.x
			@.y = if @.y < vector.y then @.y else vector.y

		return @
	
	MaxV: ( vector ) ->
		if vector == null or isNaN( vector.x ) or isNaN( vector.y )
			throw new TypeError
		else
			@.x = if @.x > vector.x then @.x else vector.x
			@.y = if @.y > vector.y then @.y else vector.y

	Abs: ->
		@.x = Math.abs( @.x )
		@.y = Math.abs( @.y )

		return @

	Length: ->
		return Math.sqrt( @.x * @.x + @.y * @.y )

	Normalize: ->
		length = @.Length()

		if length < Number.MIN_VALUE
			return 0.0;
		
		invLength = 1.0 / length

		@.x *= invLength
		@.y *= invLength

		return @

	IsValid: ->
		return box2d.Math.IsValid( @.x ) && box2d.Math.IsValid( @.y )

	Make: ( x, y ) ->
		return new box2d.Vector2D( x, y )