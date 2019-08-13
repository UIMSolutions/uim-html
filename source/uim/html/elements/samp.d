module uim.html.elements.samp;

import uim.html;

class DH5Samp : DH5Obj {
	mixin(H5This!"samp");
}
mixin(FuncH5!"Samp");

unittest {
	assert(H5Samp == "<samp></samp>");
}
