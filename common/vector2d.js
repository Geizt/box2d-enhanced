// Generated by CoffeeScript 1.3.3
(function() {

  ({
    box2d: (typeof exports !== "undefined" && exports !== null) && exports || this.box2d || (this.box2d = {})
  });

  box2d.Vector2D = (function() {

    function Vector2D(x, y) {
      if ((x != null) && !box2d.MathFunc.IsValid(x) || (y != null) && !box2d.MathFunc.IsValid(y)) {
        throw new TypeError;
      } else {
        this.x = x != null ? x : 0.0;
        this.y = y != null ? y : 0.0;
      }
    }

    Vector2D.prototype.IsValid = function() {
      return box2d.MathFunc.IsValid(this.x) && box2d.MathFunc.IsValid(this.y);
    };

    Vector2D.prototype.SetZero = function() {
      this.x = 0.0;
      this.y = 0.0;
      return this;
    };

    Vector2D.prototype.Set = function(x, y) {
      if (!(x != null) || !box2d.MathFunc.IsValid(x) || !(y != null) || !box2d.MathFunc.IsValid(y)) {
        throw new TypeError;
      } else {
        this.x = x;
        this.y = y;
      }
      return this;
    };

    Vector2D.prototype.SetV = function(vector) {
      if (vector != null) {
        if (!(typeof vector.IsValid === "function" ? vector.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      this.x = vector.x;
      this.y = vector.y;
      return this;
    };

    Vector2D.prototype.Negative = function() {
      return new box2d.Vector2D(-this.x, -this.y);
    };

    Vector2D.prototype.Copy = function() {
      return new box2d.Vector2D(this.x, this.y);
    };

    Vector2D.prototype.Add = function(vector) {
      if (vector != null) {
        if (!(typeof vector.IsValid === "function" ? vector.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      this.x += vector.x;
      this.y += vector.y;
      return this;
    };

    Vector2D.prototype.Subtract = function(vector) {
      if (vector != null) {
        if (!(typeof vector.IsValid === "function" ? vector.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      this.x -= vector.x;
      this.y -= vector.y;
      return this;
    };

    Vector2D.prototype.Multiply = function(scalar) {
      if (!(scalar != null) || !box2d.MathFunc.IsValid(scalar)) {
        throw new TypeError;
      } else {
        this.x *= scalar;
        this.y *= scalar;
      }
      return this;
    };

    Vector2D.prototype.MulM = function(matrix) {
      var tX;
      if (matrix != null) {
        if (!(typeof matrix.IsValid === "function" ? matrix.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      tX = this.x;
      this.x = matrix.column_1.x * tX + matrix.column_2.x * this.y;
      this.y = matrix.column_1.y * tX + matrix.column_2.y * this.y;
      return this;
    };

    Vector2D.prototype.MulTM = function(matrix) {
      var tX;
      if (matrix != null) {
        if (!(typeof matrix.IsValid === "function" ? matrix.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      tX = box2d.MathFunc.Dot(this, matrix.column_1);
      this.y = box2d.MathFunc.Dot(this, matrix.column_2);
      this.x = tX;
      return this;
    };

    Vector2D.prototype.CrossVS = function(scalar) {
      var tX;
      if (!(scalar != null) || !box2d.MathFunc.IsValid(scalar)) {
        throw new TypeError;
      } else {
        tX = this.x;
        this.x = scalar * this.y;
        this.y = -scalar * tX;
      }
      return this;
    };

    Vector2D.prototype.CrossSV = function(scalar) {
      var tX;
      if (!(scalar != null) || !box2d.MathFunc.IsValid(scalar)) {
        throw new TypeError;
      } else {
        tX = this.x;
        this.x = -scalar * this.y;
        this.y = scalar * tX;
      }
      return this;
    };

    Vector2D.prototype.MinV = function(vector) {
      if (vector != null) {
        if (!(typeof vector.IsValid === "function" ? vector.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      this.x = this.x < vector.x ? this.x : vector.x;
      this.y = this.y < vector.y ? this.y : vector.y;
      return this;
    };

    Vector2D.prototype.MaxV = function(vector) {
      if (vector != null) {
        if (!(typeof vector.IsValid === "function" ? vector.IsValid() : void 0)) {
          throw new TypeError;
        }
      } else {
        throw new TypeError;
      }
      this.x = this.x > vector.x ? this.x : vector.x;
      this.y = this.y > vector.y ? this.y : vector.y;
      return this;
    };

    Vector2D.prototype.Abs = function() {
      this.x = Math.abs(this.x);
      this.y = Math.abs(this.y);
      return this;
    };

    Vector2D.prototype.Length = function() {
      return Math.sqrt(this.x * this.x + this.y * this.y);
    };

    Vector2D.prototype.Normalize = function() {
      var invLength, length;
      length = this.Length();
      if (length < Number.MIN_VALUE) {
        return 0.0;
      }
      invLength = 1.0 / length;
      this.x *= invLength;
      this.y *= invLength;
      return this;
    };

    Vector2D.prototype.toString = function() {
      return "( " + this.x + ", " + this.y + " )";
    };

    Vector2D.prototype.Serialize = function() {
      return "{ 'x': " + this.x + ", 'y': " + this.y + " }";
    };

    return Vector2D;

  })();

}).call(this);
