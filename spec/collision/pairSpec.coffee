# pairSpec.coffee
box2d: exports? and exports or @box2d or @box2d = {}

describe 'Pair', ->
	pair = null

	beforeEach ->
		pair = new box2d.Pair()

	it 'can be initialized', ->
		expect( pair.nullPair ).toBe box2d.Settings.USHRT_MAX
		expect( pair.nullProxy ).toBe box2d.Settings.USHRT_MAX
		expect( pair.tableCapacity ).toBe box2d.Settings.maxPairs
		expect( pair.tableMask ).toBe pair.tableCapacity - 1
		expect( pair.pairBuffered ).toBe 0x0001
		expect( pair.pairRemoved ).toBe 0x0002
		expect( pair.pairFinal ).toBe 0x0004
		expect( pair.userData ).toBe null
		expect( pair.proxyId1 ).toBe 0
		expect( pair.proxyId2 ).toBe 0
		expect( pair.next ).toBe 0
		expect( pair.status ).toBe 0

	it 'can be validated', ->
		expect( pair.IsValid() ).toBe true

	it 'can set buffered', ->
		pair.SetBuffered()

		expect( pair.status ).toBe 0x0001

	it 'can clear buffered', ->
		pair.SetBuffered()

		expect( pair.status ).toBe 0x0001

		pair.ClearBuffered()

		expect( pair.status ).toBe 0x0000

	it 'can evaluate if buffered', ->
		expect( pair.IsBuffered() ).toBe false

		pair.SetBuffered()

		expect( pair.IsBuffered() ).toBe true

	it 'can set removed', ->
		pair.SetRemoved()

		expect( pair.status ).toBe 0x0002

	it 'can clear removed', ->
		pair.SetRemoved()

		expect( pair.status ).toBe 0x0002

		pair.ClearRemoved()

		expect( pair.status ).toBe 0x0000

	it 'can evaluate if removed', ->
		expect( pair.IsRemoved() ).toBe false

		pair.SetRemoved()

		expect( pair.IsRemoved() ).toBe true

	it 'can set final', ->
		pair.SetFinal()

		expect( pair.status ).toBe 0x0004

	it 'can evaluate if final', ->
		expect( pair.IsFinal() ).toBe false

		pair.SetFinal()

		expect( pair.IsFinal() ).toBe true