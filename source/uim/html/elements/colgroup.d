module uim.html.elements.colgroup;

import uim.html;

class DH5COLGROUP : DH5Obj {
	mixin(H5This!"COLGROUP");
}
mixin(FuncH5!"COLGROUP");

unittest {
	

	assert(H5COLGROUP == "<colgroup></colgroup>");
}
