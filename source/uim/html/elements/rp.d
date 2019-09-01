module uim.html.elements.rp;

import uim.html;

class DH5Rp : DH5Obj {
	mixin(H5This!"rp");
}
mixin(H5Short!"Rp");

unittest {
	assert(H5Rp == "<rp></rp>");
}
