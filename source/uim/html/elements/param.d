module uim.html.elements.param;

import uim.html;

class DH5PARAM : DH5Obj {
	mixin(H5This!"PARAM");
}
mixin(FuncH5!"PARAM");

unittest {
	
	
	assert(H5PARAM.toString == "<param></param>");
}
