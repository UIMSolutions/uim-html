module uim.html.elements.iframe;

import uim.html;

class DH5Iframe : DH5Obj {
	mixin(H5This!"iframe");
}
mixin(FuncH5!"Iframe");

unittest {
	
	
	assert(H5Iframe == "<iframe></iframe>");
}
