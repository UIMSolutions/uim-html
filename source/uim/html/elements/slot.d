module uim.html.elements.slot;

import uim.html;

class DH5Slot : DH5Obj {
	mixin(H5This!"slot");
}
mixin(H5Short!"Slot");

unittest {
	
	
	assert(H5Slot == "<slot></slot>");
}
