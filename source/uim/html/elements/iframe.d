module uim.html.elements.iframe;

import uim.html;

class DH5IFRAME : DH5Obj {
	mixin(H5This!"IFRAME");
}
mixin(FuncH5!"IFRAME");

unittest {
	
	
	assert(H5IFRAME == "<iframe></iframe>");
}
