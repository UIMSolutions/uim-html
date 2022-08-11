module uim.html.elements.time;

@safe:
import uim.html;
import std.datetime;

class DH5Time : DH5Obj {
	mixin(H5This!"time");
	
	mixin(MyAttribute!"datetime");
	// 0 datetime(this O)(Date value) {
		// return datetime(value.toString);
	// }
}
mixin(H5Short!"Time");

unittest {
    assert(H5Time, "<time></time>"));
}}
