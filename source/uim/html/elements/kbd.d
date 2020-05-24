module uim.html.elements.kbd;

import uim.html;

class DH5Kbd : DH5Obj {
	mixin(H5This!"kbd");
}
mixin(H5Short!"Kbd");

unittest {
	assert(Assert(H5Kbd, "<kbd></kbd>"));
}
