module uim.html.elements.decorator;

import uim.html;

class DH5DECORATOR : DH5Obj {
	mixin(H5This!("DECORATOR"));
}
mixin(FuncH5!"DECORATOR");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5DECORATOR == "<decorator></decorator>");
}
