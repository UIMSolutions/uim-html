module uim.html.elements.dt;

import uim.html;

class DH5Dt : DH5Obj {
	mixin(H5This!"dt");
}
mixin(FuncH5!"Dt");

unittest {
	assert(H5Dt == "<dt></dt>");
}