module uim.html.elements.slot;

import uim.html;

class DH5Slot : DH5Obj {
	mixin(H5This!"slot");
}
mixin(FuncH5!"Slot");

unittest {
	
	
	assert(H5Slot == "<slot></slot>");
}
