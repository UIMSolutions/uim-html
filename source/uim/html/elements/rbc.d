module uim.html.elements.rbc;

import uim.html;

class DH5Rbc : DH5Obj {
	mixin(H5This!"rbc");
}
mixin(H5Short!"Rbc");

unittest {
	assert(H5Rbc == "<rbc></rbc>");
}
