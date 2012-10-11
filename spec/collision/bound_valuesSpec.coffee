# bound_valuesSpec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'BoundValues', ->
	bound_values = null

	beforeEach ->
		bound_values = new box2d.BoundValues()

	it 'can be initialized', ->
		expect( bound_values.lowerValues[0] ).toBe 0
		expect( bound_values.lowerValues[1] ).toBe 0

		expect( bound_values.upperValues[0] ).toBe 0
		expect( bound_values.upperValues[1] ).toBe 0