# matrix2x2Spec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'Math', ->
	scalar = null
	vector2d = null
	another_vector2d = null
	matrix2x2 = null

	beforeEach ->
		scalar = 4
		vector2d = new box2d.Vector2D( 2, 3 )
		another_vector2d = new box2d.Vector2D( 4, 5 )
		matrix2x2 = new box2d.Matrix2x2( new box2d.Vector2D( 1, 2 ), new box2d.Vector2D( 3, 4 ) )

		return

	it 'can validate a scalar', ->
		expect( box2d.Math.IsValid( scalar ) ).toBe true

	it 'can calculate the dot-product', ->
		expect( box2d.Math.Dot( vector2d, another_vector2d ) ).toBe 23

	it 'can calculate the cross-product', ->
		cross_vv = box2d.Math.CrossVV( vector2d, another_vector2d )
		cross_vs = box2d.Math.CrossVS( vector2d, scalar )
		cross_sv = box2d.Math.CrossSV( scalar, another_vector2d )

		expect( cross_vv ).toBe -2

		expect( cross_vs.x ).toBe 12
		expect( cross_vs.y ).toBe -8

		expect( cross_sv.x ).toBe -20
		expect( cross_sv.y ).toBe 16