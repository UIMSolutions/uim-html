module uim.html.elements.colgroup;

import uim.html;

class DH5Colgroup : DH5Obj {
	mixin(H5This!"Colgroup");
}
mixin(H5Short!"Colgroup");

unittest {
	

	assert(H5Colgroup == "<colgroup></colgroup>");
}
