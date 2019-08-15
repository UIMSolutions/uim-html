module uim.html.elements.kbd;

import uim.html;

class DH5Kbd : DH5Obj {
	mixin(H5This!"kbd");
}
mixin(FuncH5!"Kbd");

unittest {
	assert(H5Kbd == "<kbd></kbd>");
}
