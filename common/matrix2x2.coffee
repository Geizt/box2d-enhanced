# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.Matrix2x2
	constructor: ( vector_1, vector_2, angle = 0 ) ->
		if vector_1? and not vector_1.IsValid() or vector_2? and not vector_2.IsValid() or angle? and not box2d.Math.IsValid( angle )
			throw new TypeError
		else
			@column_1 = new box2d.Vector2D()
			@column_2 = new box2d.Vector2D()

			if vector_1 != null and vector_2 != null
				@column_1.SetV( vector_1 )
				@column_2.SetV( vector_2 )
			else
				cosinus = Math.cos( angle )
				sinus = Math.sin( angle )

				@column_1.x = cosinus
				@column_1.y = sinus

				@column_2.x = -sinus
				@column_2.y = cosinus

	IsValid: ->
		@column_1 != null and @column_1.IsValid() and @column_2 != null and @column_2.IsValid()

	Set: ( angle ) ->
		if angle == null or not box2d.Math.IsValid( angle )
			throw new TypeError
		else
			cosinus = Math.cos( angle )
			sinus = Math.sin( angle )

			@column_1.x = cosinus
			@column_1.y = sinus

			@column_2.x = -sinus
			@column_2.y = cosinus

		return @

	SetVV: ( vector_1, vector_2 ) ->
		if vector_1 == null or not vector_1.IsValid() or vector_2 == null or not vector_2.IsValid()
			throw new TypeError
		else
			@column_1.SetV( vector_1 )
			@column_2.SetV( vector_2 )

		return @

	SetM: ( matrix ) ->
		if not matrix.IsValid()
			throw new TypeError
		else
			@column_1.SetV( matrix.column_1 );
			@column_2.SetV( matrix.column_2 );

	Copy: ->
		new box2d.Matrix2x2( @column_1, @column_2, 0 )

	AddM: ( matrix ) ->
		if not matrix.IsValid()
			throw new TypeError
		else
			@column_1.x += matrix.column_1.x;
			@column_1.y += matrix.column_1.y;
			@column_2.x += matrix.column_2.x;
			@column_2.y += matrix.column_2.y;

	SetIdentity: ->
		@column_1.x = 1.0;
		@column_1.y = 0.0;
		@column_2.x = 0.0;
		@column_2.y = 1.0;

	SetZero: ->
		@column_1.x = 0.0;
		@column_1.y = 0.0;
		@column_2.x = 0.0;
		@column_2.y = 0.0;

	Invert: ( matrix ) ->
		if not matrix.IsValid()
			throw new TypeError
		else
			a_11 = @column_1.x
			a_12 = @column_2.x
			a_21 = @column_1.y
			a_22 = @column_2.y
			
			det = a_11 * a_22 - a_12 * a_21
			det = 1.0 / det

			matrix.column_1.x =  det * a_22
			matrix.column_1.y = -det * a_21
			matrix.column_2.x = -det * a_12
			matrix.column_2.y =  det * a_11

		return matrix

	Solve: ( vector, bX, bY ) ->
		if not vector.IsValid()
			throw new TypeError
		else
			a_11 = @column_1.x
			a_12 = @column_2.x
			a_21 = @column_1.y
			a_22 = @column_2.y

			det = a_11 * a_22 - a_12 * a_21
			det = 1.0 / det

			vector.x = det * ( a_22 * bX - a_12 * bY )
			vector.y = det * ( a_11 * bY - a_21 * bX )

		return vector

	Abs: ->
		@column_1.Abs();
		@column_2.Abs();