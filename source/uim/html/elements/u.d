﻿module uim.html.elements.u;

import uim.html;

@safe class DH5U : DH5Obj {
	mixin(H5This!"u");
}
mixin(H5Short!"U");

unittest {
	assert(Assert(H5U,"<u></u>"));
}
