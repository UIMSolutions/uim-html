module uim.html.elements.dt;

import uim.html;

class DH5Dt : DH5Obj {
	mixin(H5This!"dt");
}
mixin(H5Short!"Dt");

unittest {
	assert(H5Dt == "<dt></dt>");
}