# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.Vector2D
	constructor: ( x, y ) ->
		if x? and not box2d.MathFunc.IsValid( x ) or y? and not box2d.MathFunc.IsValid( y )
			throw new TypeError
		else
			@x = x ? 0.0
			@y = y ? 0.0

	IsValid: ->
		box2d.MathFunc.IsValid( @.x ) && box2d.MathFunc.IsValid( @.y )

	SetZero: -> 
		@x = 0.0
		@y = 0.0

		return @

	Set: ( x, y ) -> 
		if not box2d.MathFunc.IsValid( x ) or not box2d.MathFunc.IsValid( y )
			throw new TypeError
		else
			@x = x
			@y = y

		return @

	SetV: ( vector ) -> 
		if vector == null or not vector.IsValid()
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
		if vector == null or not vector.IsValid()
			throw new TypeError
		else
			@x += vector.x
			@y += vector.y

		return @

	Subtract: ( vector ) ->
		if vector == null or not vector.IsValid()
			throw new TypeError
		else
			@x -= vector.x
			@y -= vector.y

		return @

	Multiply: ( scalar ) ->
		if scalar == null or not box2d.MathFunc.IsValid( scalar )
			throw new TypeError
		else
			@x *= scalar
			@y *= scalar

		return @

	MulM: ( matrix ) ->
		if matrix == null or not matrix.IsValid()
			throw new TypeError
		else
			tX = @.x;

			@.x = matrix.column_1.x * tX + matrix.column_2.x * @.y;
			@.y = matrix.column_1.y * tX + matrix.column_2.y * @.y;

		return @
	
	MulTM: ( matrix ) ->
		if matrix == null or not matrix.IsValid()
			throw new TypeError
		else
			tX = box2d.MathFunc.Dot( @, matrix.column_1 )

			@.y = box2d.MathFunc.Dot( @, matrix.column_2 );
			@.x = tX;

		return @

	CrossVS: ( scalar ) ->
		if scalar == null or not box2d.MathFunc.IsValid( scalar )
			throw new TypeError
		else
			tX = @.x

			@.x = scalar * @.y
			@.y = -scalar * tX

		return @

	CrossSV: ( scalar ) ->
		if scalar == null or not box2d.MathFunc.IsValid( scalar )
			throw new TypeError
		else
			tX = @.x

			@.x = -scalar * @.y
			@.y = scalar * tX

		return @

	MinV: ( vector ) ->
		if vector == null or not vector.IsValid()
			throw new TypeError
		else
			@.x = if @.x < vector.x then @.x else vector.x
			@.y = if @.y < vector.y then @.y else vector.y

		return @
	
	MaxV: ( vector ) ->
		if vector == null or not vector.IsValid()
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

	toString: ->
		return "( #{ @x }, #{ @y } )"

	Serialize: ->
		return "{ 'x': #{ @x }, 'y': #{ @y } }"