module uim.html.elements.rbc;

import uim.html;

@safe class DH5Rbc : DH5Obj {
	mixin(H5This!"rbc");
}
mixin(H5Short!"Rbc");

unittest {
	assert(Assert(H5Rbc,"<rbc></rbc>"));
}
