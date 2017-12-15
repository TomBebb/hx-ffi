import utest.Runner;
import utest.ui.Report;
class Unit {
	static function main() {
		var r = new Runner();
		r.addCase(new TestTypes());
		r.addCase(new TestTests());
		r.run();
		Report.create(r);
	}
}