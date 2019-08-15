module uim.html.elements.optgroup;

import uim.html;

class DH5Optgroup : DH5Obj {
	mixin(H5This!"optgroup");

//	O option(this O)() {
//
//	}
}
mixin(FuncH5!"Optgroup");

unittest {
	
	
	assert(H5Optgroup == "<optgroup></optgroup>");
}
