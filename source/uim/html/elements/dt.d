module uim.html.elements.dt;

import uim.html;

class DH5DT : DH5Obj {
	mixin(H5This!"DT");
}
mixin(FuncH5!"DT");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5DT == "<dt></dt>");
}