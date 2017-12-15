import utest.Assert;

class TestTests {
	var t:Tests;
	public function new() {
		t = new Tests();
	}
	public function testCool() {
		Assert.isTrue(t.get_null() == null);
		Assert.equals(1337, t.get_cool_int());
		Assert.equals("Oranges", t.get_cool_str());
		Assert.equals(88, haxe.Int64.toInt(t.add(haxe.Int64.ofInt(34), haxe.Int64.ofInt(54))));
		t.print_str("Hello, world!\n");
	}
	public function testPerson() {
		Assert.equals(42, t.answer);
		t.print_answer();
		var personPtr:ffi.Pointer = t.make_person("Tom", 234);
		Assert.isTrue(personPtr != null);
		var name:ffi.Pointer = personPtr.get(ffi.Type.POINTER);
		Assert.isTrue(name != null);
		Assert.equals("Tom", haxe.io.Bytes.ofData(name.getBytes(3)).toString());
		Assert.equals("Tom", name.getString());
		var person:Person = personPtr.get(Person.TYPE);
		Assert.equals("name: Tom, age: 234", person.toString());
		Assert.equals("name: Bobaffet, age: 23", new Person("Bobaffet", 23));
		Assert.equals("Tom", name.getString());
	}
}
@:struct(Person => {
	var name:String;
	var age:UInt8;
})
@:lib("test/test.so")
class Tests extends ffi.lib.EasyLibrary {
	public function get_cool_int():Int;
	public function get_cool_str():String;
	public function print_str(s:String):Void;
	public function get_null():Pointer;
	public function add(a:UInt64, b:UInt64):UInt64;
	public function make_person(name:String, age:UInt16):Pointer;
	public var answer:Int;
	public function print_answer():Void;
}