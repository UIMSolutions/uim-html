module uim.html.elements.decorator;

import uim.html;

class DH5DECORATOR : DH5Obj {
	mixin(H5This!("DECORATOR"));
}
mixin(FuncH5!"DECORATOR");

unittest {
	

	assert(H5DECORATOR == "<decorator></decorator>");
}
