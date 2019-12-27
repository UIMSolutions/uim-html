module uim.html.elements.noscript;

import uim.html;

class DH5Noscript : DH5Obj {
	mixin(H5This!("noscript"));
}
mixin(H5Short!"Noscript");

unittest {
	assert(Assert(H5Noscript,"<noscript></noscript>"));
}
