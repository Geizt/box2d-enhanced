// Generated by CoffeeScript 1.3.3
(function() {

  ({
    box2d: (typeof exports !== "undefined" && exports !== null) && exports || this.box2d || (this.box2d = {})
  });

  describe('Pair', function() {
    var pair;
    pair = null;
    beforeEach(function() {
      return pair = new box2d.Pair();
    });
    it('can be initialized', function() {
      expect(pair.nullPair).toBe(box2d.Settings.USHRT_MAX);
      expect(pair.nullProxy).toBe(box2d.Settings.USHRT_MAX);
      expect(pair.tableCapacity).toBe(box2d.Settings.maxPairs);
      expect(pair.tableMask).toBe(pair.tableCapacity - 1);
      expect(pair.pairBuffered).toBe(0x0001);
      expect(pair.pairRemoved).toBe(0x0002);
      expect(pair.pairFinal).toBe(0x0004);
      expect(pair.userData).toBe(null);
      expect(pair.proxyId1).toBe(0);
      expect(pair.proxyId2).toBe(0);
      expect(pair.next).toBe(0);
      return expect(pair.status).toBe(0);
    });
    it('can set buffered', function() {
      pair.SetBuffered();
      return expect(pair.status).toBe(0x0001);
    });
    it('can clear buffered', function() {
      pair.SetBuffered();
      expect(pair.status).toBe(0x0001);
      pair.ClearBuffered();
      return expect(pair.status).toBe(0x0000);
    });
    it('can evaluate if buffered', function() {
      expect(pair.IsBuffered()).toBe(false);
      pair.SetBuffered();
      return expect(pair.IsBuffered()).toBe(true);
    });
    it('can set removed', function() {
      pair.SetRemoved();
      return expect(pair.status).toBe(0x0002);
    });
    it('can clear removed', function() {
      pair.SetRemoved();
      expect(pair.status).toBe(0x0002);
      pair.ClearRemoved();
      return expect(pair.status).toBe(0x0000);
    });
    it('can evaluate if removed', function() {
      expect(pair.IsRemoved()).toBe(false);
      pair.SetRemoved();
      return expect(pair.IsRemoved()).toBe(true);
    });
    it('can set final', function() {
      pair.SetFinal();
      return expect(pair.status).toBe(0x0004);
    });
    return it('can evaluate if final', function() {
      expect(pair.IsFinal()).toBe(false);
      pair.SetFinal();
      return expect(pair.IsFinal()).toBe(true);
    });
  });

}).call(this);
