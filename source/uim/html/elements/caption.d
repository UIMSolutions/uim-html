module uim.html.elements.caption;

import uim.html;

class DH5CAPTION : DH5Obj {
	mixin(H5This!"CAPTION");
}
mixin(FuncH5!"CAPTION");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5CAPTION == "<caption></caption>");
}
