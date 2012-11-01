# pair_managerSpec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'PairManager', ->
	pair_manager = null

	beforeEach ->
		pair_manager = new box2d.PairManager()

	it 'can be initialized', ->
		broadPhase = new Object()
		callback = ->

		pair_manager_with_parameters = new box2d.PairManager( broadPhase, callback )

		expect( typeof pair_manager_with_parameters.broadPhase ).toBe 'object'
		expect( typeof pair_manager_with_parameters.callback ).toBe 'function'
		expect( pair_manager_with_parameters.pairs ).toBe null
		expect( pair_manager_with_parameters.freePair ).toBe 0
		expect( pair_manager_with_parameters.pairCount ).toBe 0
		expect( pair_manager_with_parameters.pairBuffer ).toBe null
		expect( pair_manager_with_parameters.pairBufferCount ).toBe 0
		expect( pair_manager_with_parameters.hashTable ).toBe null

		expect( pair_manager.broadPhase ).toBe null
		expect( pair_manager.callback ).toBe null
		expect( pair_manager.pairs.length ).toBe box2d.Settings.maxPairs
		expect( pair_manager.freePair ).toBe 0
		expect( pair_manager.pairCount ).toBe 0
		expect( pair_manager.pairBuffer.length ).toBe box2d.Settings.maxPairs
		expect( pair_manager.pairBufferCount ).toBe 0
		expect( pair_manager.hashTable.length ).toBe box2d.Settings.maxPairs