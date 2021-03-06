// Generated by CoffeeScript 1.3.3
(function() {

  ({
    box2d: (typeof exports !== "undefined" && exports !== null) && exports || this.box2d || (this.box2d = {})
  });

  box2d.BoundValues = (function() {

    function BoundValues() {
      this.lowerValues = [0, 0];
      this.upperValues = [0, 0];
    }

    BoundValues.prototype.IsValid = function() {
      return (this.lowerValues != null) && isFinite(this.lowerValues[0]) && isFinite(this.lowerValues[1]) && (this.upperValues != null) && isFinite(this.upperValues[0]) && isFinite(this.upperValues[1]);
    };

    return BoundValues;

  })();

}).call(this);
