# vector2dSpec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'Vector2D', ->
	vector2d = null

	beforeEach ->
		vector2d = new box2d.Vector2D( 2, 3 )

	it 'can be initialized', ->
		expect( vector2d.x ).toBe 2
		expect( vector2d.y ).toBe 3

	it 'can be validated', ->
		valid_vector2d = vector2d.IsValid();

		expect( valid_vector2d ).toBe true

	it 'can be re-set', ->
		vector2d.Set( 3, 5 )

		expect( vector2d.x ).toBe 3
		expect( vector2d.y ).toBe 5

	it 'can be negative', ->
		neg_vector2d = vector2d.Negative()

		expect( neg_vector2d.x ).toBe -2
		expect( neg_vector2d.y ).toBe -3

	it 'can be copied', ->
		copy_vector2d = vector2d.Copy()

		expect( copy_vector2d.x ).toBe 2
		expect( copy_vector2d.y ).toBe 3

	it 'can be added', ->
		vector2d.Add( new box2d.Vector2D( 1, 2 ) );

		expect( vector2d.x ).toBe 3
		expect( vector2d.y ).toBe 5

	it 'can be subtracted', ->
		vector2d.Subtract( new box2d.Vector2D( 1, 2 ) );

		expect( vector2d.x ).toBe 1
		expect( vector2d.y ).toBe 1

	it 'can be multiplied with a scalar', ->
		vector2d.Multiply( 3 )

		expect( vector2d.x ).toBe 6
		expect( vector2d.y ).toBe 9

	it 'can be multiplied with a matrix', -> 
		matrix = new box2d.Matrix2x2( new box2d.Vector2D( 1, 2 ), new box2d.Vector2D( 3, 4 ) )

		vector2d.MulM( matrix )

		expect( vector2d.x ).toBe 11
		expect( vector2d.y ).toBe 16

	it 'can be multiplied with a transposed matrix', ->
		matrix = new box2d.Matrix2x2( new box2d.Vector2D( 1, 2 ), new box2d.Vector2D( 3, 4 ) )

		vector2d.MulTM( matrix )

		expect( vector2d.x ).toBe 8
		expect( vector2d.y ).toBe 18

	it 'can be a cross product', ->
		vector2d.CrossVF( 3 )

		expect( vector2d.x ).toBe 9
		expect( vector2d.y ).toBe -6

		vector2d.Set( 2, 3 )
		vector2d.CrossFV( 3 )

		expect( vector2d.x ).toBe -9
		expect( vector2d.y ).toBe 6

	it 'can be minimum', ->
		vector2d.MinV( new box2d.Vector2D( 1, 5 ) )

		expect( vector2d.x ).toBe 1
		expect( vector2d.y ).toBe 3

	it 'can be maximum', ->
		vector2d.MaxV( new box2d.Vector2D( 1, 5 ) )

		expect( vector2d.x ).toBe 2
		expect( vector2d.y ).toBe 5

	it 'can be absolute', ->
		vector2d.Set( -4, -6 )
		vector2d.Abs()

		expect( vector2d.x ).toBe 4
		expect( vector2d.y ).toBe 6		

	it 'can be normalized', ->
		result = vector2d.Normalize().Length()

		expect( result ).toBe 1

	it 'can be a string', ->
		result = vector2d.ToString()

		expect( result ).toBe '( 2, 3 )'

	it 'can be serialized', ->
		result = vector2d.Serialize()

		expect( result ).toBe '{ "x": 2, "y": 3 }'