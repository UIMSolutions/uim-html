module uim.html.elements.dfn;

import uim.html;

class DH5Dfn : DH5Obj {
	mixin(H5This!"dfn");
}
mixin(FuncH5!"Dfn");

unittest {
	assert(H5Dfn == "<dfn></dfn>");
}
