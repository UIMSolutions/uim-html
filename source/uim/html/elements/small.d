module uim.html.elements.small;

import uim.html;

class DH5SMALL : DH5Obj {
	mixin(H5This!"SMALL");
}
mixin(FuncH5!"SMALL");

unittest {
	
	
	assert(H5SMALL == "<small></small>");
}

