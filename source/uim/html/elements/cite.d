module uim.html.elements.cite;

import uim.html;

class DH5Cite : DH5Obj {
	mixin(H5This!"cite");
}
mixin(H5Short!"Cite");

unittest {
	assert(Assert(H5Cite,"<cite></cite>"));
}

