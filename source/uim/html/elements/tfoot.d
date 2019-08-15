module uim.html.elements.tfoot;

import uim.html;

class DH5Tfoot : DH5Obj {
	mixin(H5This!"tfoot");
}
mixin(FuncH5!"Tfoot");

unittest {
	
	
	assert(H5Tfoot == "<tfoot></tfoot>");
}
