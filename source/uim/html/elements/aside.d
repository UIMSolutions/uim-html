module uim.html.elements.aside;

import uim.html;

class DH5ASIDE : DH5Obj {
	mixin(H5This!"ASIDE");
}

mixin(FuncH5!"ASIDE");

unittest {
	

	assert(H5ASIDE == "<aside></aside>");
}
