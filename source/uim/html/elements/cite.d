module uim.html.elements.cite;

import uim.html;

class DH5Cite : DH5Obj {
	mixin(H5This!"cite");
}
mixin(FuncH5!"Cite");

unittest {
	

	assert(H5Cite == "<cite></cite>");
}

