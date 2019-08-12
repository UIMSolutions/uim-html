module uim.html.elements.time;

import uim.html;
import std.datetime;

class DH5TIME : DH5Obj {
	mixin(H5This!"TIME");
	
	mixin(MyAttribute!"datetime");
	// 0 datetime(this O)(Date value) {
		// return datetime(value.toString);
	// }
}
mixin(FuncH5!"TIME");

unittest {
	
	
	assert(H5TIME == "<time></time>");
}
