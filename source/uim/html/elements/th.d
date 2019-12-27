module uim.html.elements.th;

import uim.html;

class DH5Th : DH5Obj {
	mixin(H5This!"th");
}
mixin(H5Short!"Th");

unittest {
	assert(Assert(H5Th,"<th></th>"));
}
