module uim.html.elements.iframe;

import uim.html;

class DH5Iframe : DH5Obj {
	mixin(H5This!"iframe");
}
mixin(H5Short!"Iframe");

unittest {
	assert(Assert(H5Iframe, "<iframe></iframe>"));
}
