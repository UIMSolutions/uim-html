module uim.html.elements.small;

import uim.html;

class DH5Small : DH5Obj {
	mixin(H5This!"small");
}
mixin(FuncH5!"Small");

unittest {
	
	
	assert(H5Small == "<small></small>");
}

