# mathSpec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'MathFunc', ->
	scalar = null
	vector2d = null
	another_vector2d = null
	matrix2x2 = null
	another_matrix2x2 = null

	beforeEach ->
		scalar = 4
		vector2d = new box2d.Vector2D( 2, 3 )
		another_vector2d = new box2d.Vector2D( 4, 5 )
		matrix2x2 = new box2d.Matrix2x2( new box2d.Vector2D( 1, 2 ), new box2d.Vector2D( 3, 4 ) )
		another_matrix2x2 = new box2d.Matrix2x2( new box2d.Vector2D( 5, 6 ), new box2d.Vector2D( 7, 8 ) )

		return

	it 'can validate a scalar', ->
		expect( box2d.MathFunc.IsValid( scalar ) ).toBe true

	it 'can calculate the dot-product', ->
		expect( box2d.MathFunc.Dot( vector2d, another_vector2d ) ).toBe 23

	it 'can calculate the cross-product', ->
		cross_vv = box2d.MathFunc.CrossVV( vector2d, another_vector2d )
		cross_vs = box2d.MathFunc.CrossVS( vector2d, scalar )
		cross_sv = box2d.MathFunc.CrossSV( scalar, another_vector2d )

		expect( cross_vv ).toBe -2

		expect( cross_vs.x ).toBe 12
		expect( cross_vs.y ).toBe -8

		expect( cross_sv.x ).toBe -20
		expect( cross_sv.y ).toBe 16

	it 'can it multiply a matrix with a vector', ->
		mulmv = box2d.MathFunc.MulMV( matrix2x2, vector2d )

		expect( mulmv.x ).toBe 11
		expect( mulmv.y ).toBe 16

	it 'can it multiply a vector with a matrix', ->
		mulvm = box2d.MathFunc.MulVM( vector2d, matrix2x2 )

		expect( mulvm.x ).toBe 8
		expect( mulvm.y ).toBe 18

	it 'can add a vector with a vector', ->
		addvv = box2d.MathFunc.AddVV( vector2d, another_vector2d )

		expect( addvv.x ).toBe 6
		expect( addvv.y ).toBe 8

	it 'can subtract a vector from a vector', ->
		subtractvv = box2d.MathFunc.SubtractVV( vector2d, another_vector2d )

		expect( subtractvv.x ).toBe -2
		expect( subtractvv.y ).toBe -2

	it 'can multiply a vector with a scalar', ->
		mulsv = box2d.MathFunc.MulSV( scalar, vector2d )

		expect( mulsv.x ).toBe 8
		expect( mulsv.y ).toBe 12

	it 'can add a matrix with a matrix', ->
		addmm = box2d.MathFunc.AddMM( matrix2x2, another_matrix2x2 )

		expect( addmm.column_1.x ).toBe 6
		expect( addmm.column_1.y ).toBe 8
		expect( addmm.column_2.x ).toBe	10
		expect( addmm.column_2.y ).toBe	12

	it 'can multiply a matrix with a matrix', ->
		mulmm = box2d.MathFunc.MulMM( matrix2x2, another_matrix2x2 )

		# 1 3  x  5 7  = 23 31
		# 2 4     6 8    34 46

		expect( mulmm.column_1.x ).toBe 23
		expect( mulmm.column_1.y ).toBe 34
		expect( mulmm.column_2.x ).toBe 31
		expect( mulmm.column_2.y ).toBe 46	

	it 'can multiply a transposed matrix with a matrix', ->
		multmm = box2d.MathFunc.MulTMM( matrix2x2, another_matrix2x2 )

		# 1 2  x  5 7  = 17 23
		# 3 4     6 8    39 53

		expect( multmm.column_1.x ).toBe 17
		expect( multmm.column_1.y ).toBe 39
		expect( multmm.column_2.x ).toBe 23
		expect( multmm.column_2.y ).toBe 53

	it 'can calculate the absolute value of a scalar', ->
		abs = box2d.MathFunc.Abs( -scalar )

		expect( abs ).toBe 4

	it 'can calculate the absolute value of a vector', ->
		absv = box2d.MathFunc.AbsV( new box2d.Vector2D( -4, 5 ) )

		expect( absv.x ).toBe 4
		expect( absv.y ).toBe 5

	it 'can calculate the absolute value of a matrix', ->
		absm = box2d.MathFunc.AbsM( new box2d.Matrix2x2( new box2d.Vector2D( 4, -5 ), new box2d.Vector2D( -6, 7 ) ) )

		expect( absm.column_1.x ).toBe 4
		expect( absm.column_1.y ).toBe 5
		expect( absm.column_2.x ).toBe 6
		expect( absm.column_2.y ).toBe 7

	it 'can calculate the minimum between scalars', ->
		min = box2d.MathFunc.Min( 3, 4 )

		expect( min ).toBe 3

	it 'can calculate the minimum between vectors', ->
		minv = box2d.MathFunc.MinV( vector2d, another_vector2d )

		expect( minv.x ).toBe 2
		expect( minv.y ).toBe 3

	it 'can calculate the maximum between scalars', ->
		max = box2d.MathFunc.Max( 3, 4 )

		expect( max ).toBe 4

	it 'can calculate the maximum between vectors', ->
		maxv = box2d.MathFunc.MaxV( vector2d, another_vector2d )

		expect( maxv.x ).toBe 4
		expect( maxv.y ).toBe 5

	it 'can clamp a scalar', ->
		clamp = box2d.MathFunc.Clamp( scalar, 1, 10 )
		clamp_lower = box2d.MathFunc.Clamp( scalar, 5, 10 )
		clamp_upper = box2d.MathFunc.Clamp( scalar, 1, 3 )

		expect( clamp ).toBe 4
		expect( clamp_lower ).toBe 5
		expect( clamp_upper ).toBe 3

	it 'can clamp a vector', ->
		clampv = box2d.MathFunc.ClampV( vector2d, new box2d.Vector2D( 1, 1 ), new box2d.Vector2D( 4, 4 ) )
		clampv_lower = box2d.MathFunc.ClampV( vector2d, new box2d.Vector2D( 3, 3 ), new box2d.Vector2D( 5, 5 ) )
		clampv_upper = box2d.MathFunc.ClampV( vector2d, new box2d.Vector2D( 1, 1 ), new box2d.Vector2D( 2, 2 ) )

		expect( clampv.x ).toBe 2
		expect( clampv.y ).toBe 3
		expect( clampv_lower.x ).toBe 3
		expect( clampv_lower.y ).toBe 3
		expect( clampv_upper.x ).toBe 2
		expect( clampv_upper.y ).toBe 2

	it 'can swap values', ->
		array_1 = []
		array_2 = []

		array_1[0] = 1
		array_2[0] = 2

		box2d.MathFunc.Swap( array_1, array_2 )

		expect( array_1[0] ).toBe 2
		expect( array_2[0] ).toBe 1

	it 'can generate a random value', ->
		rand_1 = box2d.MathFunc.Random()
		rand_2 = box2d.MathFunc.Random()

		expect( rand_1 ).not.toBe rand_2

	it 'can calculate the next power of 2', ->
		next_power_1 = box2d.MathFunc.NextPowerOfTwo( 3 )
		next_power_2 = box2d.MathFunc.NextPowerOfTwo( 128 )
		next_power_3 = box2d.MathFunc.NextPowerOfTwo( 33000 )

		expect( next_power_1 ).toBe 4
		expect( next_power_2 ).toBe 256
		expect( next_power_3 ).toBe 65536

	it 'can evaluate if a number is a power of 2', ->
		expect( box2d.MathFunc.IsPowerOfTwo( 3 ) ).toBe false
		expect( box2d.MathFunc.IsPowerOfTwo( 16 ) ).toBe true
		expect( box2d.MathFunc.IsPowerOfTwo( 1024 ) ).toBe true