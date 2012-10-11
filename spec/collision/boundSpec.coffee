# boundSpec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'Bound', ->
	bound = null
	another_bound = null

	beforeEach ->
		bound = new box2d.Bound()
		another_bound = new box2d.Bound()

	it 'can be initialized', ->
		expect( bound.value ).toBe 0
		expect( bound.proxyId ).toBe 0
		expect( bound.stabbingCount ).toBe 0

	it 'can check lower', ->
		another_bound.value = 1

		expect( bound.IsLower() ).toBe true
		expect( another_bound.IsLower() ).toBe false

	it 'can check upper', ->
		another_bound.value = 1

		expect( bound.IsUpper() ).toBe false
		expect( another_bound.IsUpper() ).toBe true

	it 'can swap values', ->
		another_bound.value = 1
		another_bound.proxyId = 2
		another_bound.stabbingCount = 3

		expect( bound.value ).toBe 0
		expect( bound.proxyId ).toBe 0
		expect( bound.stabbingCount ).toBe 0

		expect( another_bound.value ).toBe 1
		expect( another_bound.proxyId ).toBe 2
		expect( another_bound.stabbingCount ).toBe 3

		bound.Swap( another_bound )

		expect( bound.value ).toBe 1
		expect( bound.proxyId ).toBe 2
		expect( bound.stabbingCount ).toBe 3

		expect( another_bound.value ).toBe 0
		expect( another_bound.proxyId ).toBe 0
		expect( another_bound.stabbingCount ).toBe 0		