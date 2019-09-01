module uim.html.elements.meter;

import uim.html;

class DH5Meter : DH5Obj {
	mixin(H5This!"meter");
}
mixin(H5Short!"Meter");

unittest {
	
	
	assert(H5Meter == "<meter></meter>");
}
