# matrix2x2Spec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'Math', ->
	scalar = null
	vector2d = null
	matrix2x2 = null

	beforeEach ->
		scalar = 4
		vector2d = new box2d.Vector2D( 2, 3 )
		matrix2x2 = new box2d.Matrix2x2( new box2d.Vector2D( 1, 2 ), new box2d.Vector2D( 3, 4 ) )

		return

	it 'can validate', ->
		expect( box2d.Math.IsValid( scalar ) ).toBe true