# matrix2x2Spec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'Matrix2x2', ->
	matrix2x2 = null

	beforeEach ->
		matrix2x2 = new box2d.Matrix2x2( new box2d.Vector2D( 1, 2 ), new box2d.Vector2D( 3, 4 ) )

	it 'can be initialized', ->
		expect( matrix2x2.column_1.x ).toBe 1
		expect( matrix2x2.column_1.y ).toBe 2
		expect( matrix2x2.column_2.x ).toBe 3
		expect( matrix2x2.column_2.y ).toBe 4

	it 'can be validated', ->
		valid_matrix2x2 = matrix2x2.IsValid();

		expect( valid_matrix2x2 ).toBe true

	it 'can be re-set with an angle', ->
		matrix2x2.Set( 30.0 )

		expect( matrix2x2.column_1.x ).toBe 0.15425144988758405
		expect( matrix2x2.column_1.y ).toBe -0.9880316240928618
		expect( matrix2x2.column_2.x ).toBe 0.9880316240928618
		expect( matrix2x2.column_2.y ).toBe 0.15425144988758405

	it 'can be re-set with vectors', ->
		matrix2x2.SetVV( new box2d.Vector2D( 5, 6 ), new box2d.Vector2D( 7, 8 ) )

		expect( matrix2x2.column_1.x ).toBe 5
		expect( matrix2x2.column_1.y ).toBe 6
		expect( matrix2x2.column_2.x ).toBe 7
		expect( matrix2x2.column_2.y ).toBe 8

	it 'can be copied', ->
		copy_matrix2x2 = matrix2x2.Copy()

		expect( copy_matrix2x2.column_1.x ).toBe 1
		expect( copy_matrix2x2.column_1.y ).toBe 2
		expect( copy_matrix2x2.column_2.x ).toBe 3
		expect( copy_matrix2x2.column_2.y ).toBe 4

	it 'can be added', ->
		matrix2x2.AddM( new box2d.Matrix2x2( new box2d.Vector2D( 5, 6 ), new box2d.Vector2D( 7, 8 ) ) )

		expect( matrix2x2.column_1.x ).toBe 6
		expect( matrix2x2.column_1.y ).toBe 8
		expect( matrix2x2.column_2.x ).toBe 10
		expect( matrix2x2.column_2.y ).toBe 12

	it 'can be set to the identity', ->
		matrix2x2.SetIdentity()

		expect( matrix2x2.column_1.x ).toBe 1.0
		expect( matrix2x2.column_1.y ).toBe 0.0
		expect( matrix2x2.column_2.x ).toBe 0.0
		expect( matrix2x2.column_2.y ).toBe 1.0

	it 'can be set to zero', ->
		matrix2x2.SetZero()

		expect( matrix2x2.column_1.x ).toBe 0.0
		expect( matrix2x2.column_1.y ).toBe 0.0
		expect( matrix2x2.column_2.x ).toBe 0.0
		expect( matrix2x2.column_2.y ).toBe 0.0

	it 'can be inverted', ->
		inverted_matrix2x2 = matrix2x2.Invert( new box2d.Matrix2x2( new box2d.Vector2D(), new box2d.Vector2D() ) )

		expect( inverted_matrix2x2.column_1.x ).toBe -2.0
		expect( inverted_matrix2x2.column_1.y ).toBe 1.0
		expect( inverted_matrix2x2.column_2.x ).toBe 1.5
		expect( inverted_matrix2x2.column_2.y ).toBe -0.5

	it 'can be solved', ->
		solved_vector2d = matrix2x2.Solve( new box2d.Vector2D(), 1.0, 2.0 )

		expect( solved_vector2d.x ).toBe 1.0
		expect( solved_vector2d.y ).toBe 0.0

	it 'can be absolute', ->
		matrix2x2.SetVV( new box2d.Vector2D( -2, 3 ), new box2d.Vector2D( 4, -5 ) )
		matrix2x2.Abs()

		expect( matrix2x2.column_1.x ).toBe 2.0
		expect( matrix2x2.column_1.y ).toBe 3.0
		expect( matrix2x2.column_2.x ).toBe 4.0
		expect( matrix2x2.column_2.y ).toBe 5.0