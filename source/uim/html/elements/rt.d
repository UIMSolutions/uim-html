module uim.html.elements.rt;

import uim.html;

class DH5Rt : DH5Obj {
	mixin(H5This!"rt");
}
mixin(H5Short!"Rt");

unittest {
	assert(Assert(H5Rt,"<rt></rt>"));
}
