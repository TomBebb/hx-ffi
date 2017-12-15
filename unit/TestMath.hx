import utest.Assert;

class TestMath {
	var m:NativeMath;
	public function new() {
		m = new NativeMath();
	}
	public function testSqrt():Void {
		Assert.equals(10.0, m.sqrt(100));
		Assert.equals(2.0, m.sqrt(4));
	}
	public function testPow():Void {
		Assert.equals(4.0, m.pow(2, 2));
		Assert.equals(25.0, m.pow(5, 2));
		Assert.equals(21.0, m.pow(m.sqrt(21), 2));
		Assert.equals(256.0, m.pow(2, 8));
		Assert.equals(2.0, m.pow(4, 0.5));
	}
	public function testTrig():Void {
		Assert.equals(-1.0, m.cos(Math.PI));
		Assert.equals(0.0, m.sin(0));
	}
	public function testCbrt():Void {
		for(i in 2...50) {
			var ix:Float = i;
			Assert.equals(ix, Math.round(m.cbrt(m.pow(ix, 3))));
		}
	}
	public function testRound():Void {
		Assert.equals(-3.0, m.round(-3.4));
		Assert.equals(3, haxe.Int64.toInt(m.llround(3.2)));
	}
}
@:lib("m")
class NativeMath extends ffi.lib.EasyLibrary {
	public function cos(x:Float):Float;
	public function tan(x:Float):Float;
	public function sin(x:Float):Float;
	public function acos(x:Float):Float;
	public function atan(x:Float):Float;
	public function asin(x:Float):Float;
	public function sqrt(x:Float):Float;
	public function cbrt(x:Float):Float;
	public function pow(x:Float, y:Float):Float;
	public function round(x:Float):Float;
	public function llround(x:Float):Int64;
}