module uim.html.elements.aside;

import uim.html;

class DH5Aside : DH5Obj {
	mixin(H5This!"Aside");
}

mixin(FuncH5!"aside");

unittest {
	

	assert(H5Aside == "<aside></aside>");
}
