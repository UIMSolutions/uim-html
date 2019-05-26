module uim.html.elements.colgroup;

import uim.html;

class DH5COLGROUP : DH5Obj {
	mixin(H5This!"COLGROUP");
}
mixin(FuncH5!"COLGROUP");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5COLGROUP == "<colgroup></colgroup>");
}
