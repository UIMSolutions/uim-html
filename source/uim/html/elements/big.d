﻿module uim.html.elements.big;

import uim.html;

@safe class DH5Big : DH5Obj {
	mixin(H5This!"Big");
}
mixin(H5Short!"Big");

unittest {
	assert(Assert(H5Big,"<big></big>"));
}

