module uim.html.elements.rt;

import uim.html;

class DH5RT : DH5Obj {
	mixin(H5This!"RT");
}
mixin(FuncH5!"RT");

unittest {
	
	
	assert(H5RT == "<rt></rt>");
}
