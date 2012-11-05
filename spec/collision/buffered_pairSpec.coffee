# buffered_pairSpec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'BufferedPair', ->
	buffered_pair = null

	beforeEach ->
		buffered_pair = new box2d.BufferedPair()

	it 'can be initialized', ->
		expect( buffered_pair.proxyId1 ).toBe 0
		expect( buffered_pair.proxyId2 ).toBe 0

	it 'can be validated', ->
		expect( buffered_pair.IsValid() ).toBe true