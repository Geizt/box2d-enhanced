// Generated by CoffeeScript 1.3.3
(function() {

  ({
    box2d: (typeof exports !== "undefined" && exports !== null) && exports || this.box2d || (this.box2d = {})
  });

  describe('Vector2D', function() {
    var vector2d;
    vector2d = null;
    beforeEach(function() {
      vector2d = new box2d.Vector2D(2, 3);
    });
    it('can be initialized', function() {
      expect(vector2d.x).toBe(2);
      return expect(vector2d.y).toBe(3);
    });
    it('can be validated', function() {
      var valid_vector2d;
      valid_vector2d = vector2d.IsValid();
      return expect(valid_vector2d).toBe(true);
    });
    it('can be re-set', function() {
      vector2d.Set(3, 5);
      expect(vector2d.x).toBe(3);
      return expect(vector2d.y).toBe(5);
    });
    it('can be negative', function() {
      var neg_vector2d;
      neg_vector2d = vector2d.Negative();
      expect(neg_vector2d.x).toBe(-2);
      return expect(neg_vector2d.y).toBe(-3);
    });
    it('can be copied', function() {
      var copy_vector2d;
      copy_vector2d = vector2d.Copy();
      expect(copy_vector2d.x).toBe(2);
      return expect(copy_vector2d.y).toBe(3);
    });
    it('can be added', function() {
      vector2d.Add(new box2d.Vector2D(1, 2));
      expect(vector2d.x).toBe(3);
      return expect(vector2d.y).toBe(5);
    });
    it('can be subtracted', function() {
      vector2d.Subtract(new box2d.Vector2D(1, 2));
      expect(vector2d.x).toBe(1);
      return expect(vector2d.y).toBe(1);
    });
    it('can be multiplied with a scalar', function() {
      vector2d.Multiply(3);
      expect(vector2d.x).toBe(6);
      return expect(vector2d.y).toBe(9);
    });
    it('can be multiplied with a matrix', function() {
      var matrix;
      matrix = new box2d.Matrix2x2(new box2d.Vector2D(1, 2), new box2d.Vector2D(3, 4));
      vector2d.MulM(matrix);
      expect(vector2d.x).toBe(11);
      return expect(vector2d.y).toBe(16);
    });
    it('can be multiplied with a transposed matrix', function() {
      var matrix;
      matrix = new box2d.Matrix2x2(new box2d.Vector2D(1, 2), new box2d.Vector2D(3, 4));
      vector2d.MulTM(matrix);
      expect(vector2d.x).toBe(8);
      return expect(vector2d.y).toBe(18);
    });
    it('can be a cross product', function() {
      vector2d.CrossVS(3);
      expect(vector2d.x).toBe(9);
      expect(vector2d.y).toBe(-6);
      vector2d.Set(2, 3);
      vector2d.CrossSV(3);
      expect(vector2d.x).toBe(-9);
      return expect(vector2d.y).toBe(6);
    });
    it('can be minimum', function() {
      vector2d.MinV(new box2d.Vector2D(1, 5));
      expect(vector2d.x).toBe(1);
      return expect(vector2d.y).toBe(3);
    });
    it('can be maximum', function() {
      vector2d.MaxV(new box2d.Vector2D(1, 5));
      expect(vector2d.x).toBe(2);
      return expect(vector2d.y).toBe(5);
    });
    it('can be absolute', function() {
      vector2d.Set(-4, -6);
      vector2d.Abs();
      expect(vector2d.x).toBe(4);
      return expect(vector2d.y).toBe(6);
    });
    it('can be normalized', function() {
      var result;
      result = vector2d.Normalize().Length();
      return expect(result).toBe(1);
    });
    it('can be converted to a string', function() {
      var result;
      result = vector2d.toString();
      return expect(result).toBe('( 2, 3 )');
    });
    return it('can be serialized', function() {
      var result;
      result = vector2d.Serialize();
      return expect(result).toBe("{ 'x': 2, 'y': 3 }");
    });
  });

}).call(this);
