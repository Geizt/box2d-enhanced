# Create a namespace to export public methods
box2d: exports? and exports or @box2d or @box2d = {}

class box2d.AABB
	constructor: ( minVertex, maxVertex ) ->
		if minVertex? 
			if not minVertex.IsValid?()
				throw new TypeError

		if maxVertex?
			if not maxVertex.IsValid?()
				throw new TypeError

		@minVertex = new box2d.Vector2D()
		@maxVertex = new box2d.Vector2D()

		if minVertex? and maxVertex?
			@minVertex.SetV( minVertex )
			@maxVertex.SetV( maxVertex )

	IsValid: ->
		dX = @maxVertex.x
		dY = @maxVertex.y

		dX -= @minVertex.x
		dY -= @minVertex.y

		valid = dX >= 0.0 && dY >= 0.0

		return valid && @minVertex.IsValid() && @maxVertex.IsValid()