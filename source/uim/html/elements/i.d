module uim.html.elements.i;

import uim.html;

class DH5I : DH5Obj {
	mixin(H5This!"I");
}
mixin(H5Short!"I");

unittest {
	
	
	assert(H5I == "<i></i>");
}
