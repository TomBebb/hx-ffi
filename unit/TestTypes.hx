import ffi.Type.*;
import utest.Assert;
class TestTypes {
	public function new() {

	}
	public function testInt():Void {
		Assert.equals(4, SINT32.size);
		Assert.equals(null, SINT32.elements);
	}
	public function testStruct():Void {
		var s = createStruct([SINT32, UINT32]);
		Assert.equals("{Int32, UInt32}", s.toString());
	}
}