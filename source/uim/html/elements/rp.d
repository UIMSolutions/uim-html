﻿module uim.html.elements.rp;

import uim.html;

@safe class DH5Rp : DH5Obj {
	mixin(H5This!"rp");
}
mixin(H5Short!"Rp");

unittest {
	assert(Assert(H5Rp,"<rp></rp>"));
}
