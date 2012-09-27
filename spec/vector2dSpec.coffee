# vector2dSpec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'Vector2D', ->
	vector2d = null

	beforeEach ->
		vector2d = new box2d.Vector2D( 2, 3 )

	it 'can be initialized', ->
		expect( vector2d.x ).toBe 2
		expect( vector2d.y ).toBe 3

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
		another_vector2d = new box2d.Vector2D(1, 2)

		vector2d.Add( another_vector2d );

		expect( vector2d.x ).toBe 3
		expect( vector2d.y ).toBe 5

	it 'can be subtracted', ->
		another_vector2d = new box2d.Vector2D(1, 2)

		vector2d.Subtract( another_vector2d );

		expect( vector2d.x ).toBe 1
		expect( vector2d.y ).toBe 1

	it 'can be multiplied by a scalar', ->
		vector2d.Multiply( 3 )

		expect( vector2d.x ).toBe 6
		expect( vector2d.y ).toBe 9

	it 'can be a cross product', ->
		vector2d.CrossVF( 3 )

		expect( vector2d.x ).toBe 9
		expect( vector2d.y ).toBe -6

		vector2d.Set( 2, 3 )
		vector2d.CrossFV( 3 )

		expect( vector2d.x ).toBe -9
		expect( vector2d.y ).toBe 6

	it 'can be minimum', ->
		another_vector2d = new box2d.Vector2D( 1, 5 )

		vector2d.MinV( another_vector2d )

		expect( vector2d.x ).toBe 1
		expect( vector2d.y ).toBe 3

	it 'can be maximum', ->
		another_vector2d = new box2d.Vector2D( 1, 5 )

		vector2d.MaxV( another_vector2d )

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