module uim.html.elements.small;

import uim.html;

class DH5Small : DH5Obj {
	mixin(H5This!"small");
}
mixin(H5Short!"Small");

unittest {
	
	
	assert(H5Small == "<small></small>");
}

