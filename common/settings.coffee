# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.Settings
	@USHRT_MAX: 0x0000ffff
	@pi: Math.PI
	@massUnitsPerKilogram: 1.0
	@timeUnitsPerSecond: 1.0
	@lengthUnitsPerMeter: 30.0
	@maxManifoldPoints: 2
	@maxShapesPerBody: 64
	@maxPolyVertices: 8
	@maxProxies: 1024
	@maxPairs: 8 * @maxProxies
	@linearSlop: 0.005 * @lengthUnitsPerMeter
	@angularSlop: 2.0 / 180.0 * @pi
	@velocityThreshold: 1.0 * @lengthUnitsPerMeter / @timeUnitsPerSecond
	@maxLinearCorrection: 0.2 * @lengthUnitsPerMeter
	@maxAngularCorrection: 8.0 / 180.0 * @pi
	@contactBaumgarte: 0.2
	@timeToSleep: 0.5 * @timeUnitsPerSecond
	@linearSleepTolerance: 0.01 * @lengthUnitsPerMeter / @timeUnitsPerSecond
	@angularSleepTolerance: 2.0 / 180.0 / @timeUnitsPerSecond

	@Assert: (a) ->
		nullVec = { x: 0 }

		if not a
			nullVec.x++

			return false

		return true
			