# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.Math
	@IsValid: ( x ) ->
		return isFinite( x )

	@Dot: ( vector_1, vector_2 ) ->
		if vector_1 == null or not vector_1.IsValid() or vector_2 == null or not vector_2.IsValid()
			throw new TypeError
		
		return vector_1.x * vector_2.x + vector_1.y * vector_2.y;
	
	@CrossVV: ( vector_1, vector_2 ) ->
		if vector_1 == null or not vector_1.IsValid() or vector_2 == null or not vector_2.IsValid()
			throw new TypeError

		return vector_1.x * vector_2.y - vector_1.y * vector_2.x;

	@CrossVF: ( vector, scalar ) ->
		if vector == null or not vector.IsValid() or scalar == null or not @IsValid( scalar )
			throw new TypeError

		return new box2d.Vector2D( scalar * vector.y, -scalar * vector.x );
	
	@CrossFV: ( scalar, vector ) ->
		if scalar == null or not @IsValid( scalar ) or vector == null or not vector.IsValid()
			throw new TypeError

		return new box2d.Vector2D( -scalar * vector.y, scalar * vector.x )

	@MulMV: ( matrix, vector ) ->
		if matrix == null or not matrix.IsValid() or vector == null or not vector.IsValid()
			throw new TypeError

		return new box2d.Vector2D( matrix.column_1.x * vector.x + matrix.column_2.x * vector.y, matrix.column_1.y * vector.x + matrix.column_2.y * vector.y )

	@MulTMV: ( matrix, vector ) ->
		if matrix == null or not matrix.IsValid() or vector == null or not vector.IsValid()
			throw new TypeError
			
		return new box2dVector2D( @Dot( vector , matrix.column_1 ), @Dot( vector, matrix.column_2 ) )

	@AddVV: ( vector_1, vector_2 ) ->
		return new box2d.Vector2D( vector_1.x + vector_2.x, vector_1.y + vector_2.y )

	@SubtractVV: ( vector_1, vector_2 ) ->
		return new box2d.Vector2D( vector_1.x - vector_2.x, vector_1.y - vector_2.y )

	@MulFV: ( scalar, vector ) ->
		return new box2d.Vector2D( scalar * vector.x, scalar * vector.y )

	@AddMM: ( matrix_1, matrix_2 ) ->
		return new box2d.Matrix2x2( @AddVV( matrix_1.column_1, matrix_2.column_1 ), @AddVV( matrix_1.column_2, matrix_2.column_2 ) )
	
	@MulMM: ( matrix_1, matrix_2 ) ->
		return new box2d.Matrix2x2( @MulMV( matrix_1, matrix_2.column_1 ), @MulMV( matrix_1, matrix_2.column_2 ) )

	@MulTMM: ( matrix_1, matrix_2 ) ->		
		return new box2d.Matrix2x2( new box2d.Vector2D( @Dot( matrix_1.column_1, matrix_2.column_1 ), @Dot( matrix_1.column_2, matrix_2.column_1 ) ), new box2d.Vector2D( @Dot( matrix_1.column_1, matrix_2.column_2 ), @Dot( matrix_1.column_2, matrix_2.column_2 ) ) )

	@Abs: ( scalar ) ->
		return if scalar > 0.0 then scalar else -scalar

	@AbsV: ( vector ) ->
		return new box2d.Vector2D( @Abs(vector.x), @Abs(vector.y ) )

	@AbsM: ( matrix ) ->
		return new box2d.Matrix2x2( @AbsV( matrix.column_1 ), @AbsV( matrix_1.column_2 ) )

	@Min: ( scalar_1, scalar_2 ) ->
		return if scalar_1 < scalar_2 then scalar_1 else scalar_2

	@MinV: ( vector_1, vector_2 ) ->
		return new box2d.Vector2D( @Min( vector_1.x, vector_2.x ), @Min( vector_1.y, vector_2.y ) )

	@Max: ( scalar_1, scalar_2 ) ->
		return if scalar_1 > scalar_2 then scalar_1 else scalar_2

	@MaxV: ( vector_1, vector_2 ) ->
		return new box2d.Vector2D( @Max( vector_1.x, vector_2.x ), @Max( vector_1.y, vector_2.y ) )

	@Clamp: ( scalar, lower_limit, upper_limit ) ->
		return @Max( lower_limit, @Min( scalar, upper_limit ) )

	@ClampV: ( vector, lower_limit, upper_limit ) ->
		return @MaxV( lower_limit, @MinV( vector, upper_limit ) )

	@Swap: ( array_1 , array_2 ) ->
		[array_1[0], array_2[0]] = [array_2[0], array_1[0]]

		return

	@Random: ->
		return Math.random() * 2 - 1

	@NextPowerOfTwo: ( x ) ->
		x |= ( x >> 1 ) & 0x7FFFFFFF
		x |= ( x >> 2 ) & 0x3FFFFFFF
		x |= ( x >> 4 ) & 0x0FFFFFFF
		x |= ( x >> 8 ) & 0x00FFFFFF
		x |= ( x >> 16 ) & 0x0000FFFF
		
		return x + 1

	@IsPowerOfTwo: ( x ) ->
		return x > 0 && ( x & ( x - 1 ) ) == 0