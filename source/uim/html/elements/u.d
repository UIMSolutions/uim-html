module uim.html.elements.u;

import uim.html;

class DH5U : DH5Obj {
	mixin(H5This!"u");
}
mixin(FuncH5!"U");

unittest {
	assert(H5U == "<u></u>");
}
