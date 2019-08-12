module uim.html.elements.dfn;

import uim.html;

class DH5DFN : DH5Obj {
	mixin(H5This!"DFN");
}
mixin(FuncH5!"DFN");

unittest {
	

	assert(H5DFN == "<dfn></dfn>");
}
