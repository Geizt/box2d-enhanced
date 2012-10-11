# aabbSpec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'AABB', ->
	vector2d = null
	another_vector2d = null
	aabb = null

	beforeEach ->
		vector2d = new box2d.Vector2D( 2, 3 )
		another_vector2d = new box2d.Vector2D( 4, 5 )
		aabb = new box2d.AABB( vector2d, another_vector2d )

		return

	it 'can be initialized', ->
		another_aabb = new box2d.AABB()

		expect( aabb.minVertex.x ).toBe 2
		expect( aabb.minVertex.y ).toBe 3

		expect( aabb.maxVertex.x ).toBe 4
		expect( aabb.maxVertex.y ).toBe 5

		expect( another_aabb.minVertex.x ).toBe 0
		expect( another_aabb.minVertex.y ).toBe 0

		expect( another_aabb.maxVertex.x ).toBe 0
		expect( another_aabb.maxVertex.y ).toBe 0

	it 'can be validated', ->
		another_aabb = new box2d.AABB( another_vector2d, vector2d )

		expect( aabb.IsValid() ).toBe true
		expect( another_aabb.IsValid() ).toBe false