module uim.html.elements.tfoot;

import uim.html;

class DH5TFOOT : DH5Obj {
	mixin(H5This!"TFOOT");
}
mixin(FuncH5!"TFOOT");

unittest {
	
	
	assert(H5TFOOT == "<tfoot></tfoot>");
}
