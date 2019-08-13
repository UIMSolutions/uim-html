module uim.html.elements.rt;

import uim.html;

class DH5Rt : DH5Obj {
	mixin(H5This!"rt");
}
mixin(FuncH5!"Rt");

unittest {
	
	
	assert(H5Rt == "<rt></rt>");
}
