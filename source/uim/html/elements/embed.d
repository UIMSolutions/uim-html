module uim.html.elements.embed;

import uim.html;

class DH5Embed : DH5Obj {
	mixin(H5This!"embed");
}
mixin(H5Short!"Embed");

unittest {
	assert(Assert(H5Embed,"<embed></embed>"));
}
