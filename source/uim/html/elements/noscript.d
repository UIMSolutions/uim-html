module uim.html.elements.noscript;

import uim.html;

class DH5Noscript : DH5Obj {
	mixin(H5This!("noscript"));
}
mixin(FuncH5!"Noscript");

unittest {
	
	
	assert(H5Noscript == "<noscript></noscript>");
}
