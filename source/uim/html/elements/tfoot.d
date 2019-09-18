module uim.html.elements.tfoot;

import uim.html;

class DH5Tfoot : DH5Obj {
	mixin(H5This!"tfoot");

	mixin(MyContent!("tr", "H5Tr"));
}
mixin(H5Short!"Tfoot");

unittest {
	assert(H5Tfoot == "<tfoot></tfoot>");
}
