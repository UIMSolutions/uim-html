﻿module uim.html.elements.keygen;

import uim.html;

class DH5Keygen : DH5Obj {
	mixin(H5This!"keygen");
}
mixin(H5Short!"Keygen");

unittest {
	assert(Assert(H5Keygen,"<keygen></keygen>"));
}
