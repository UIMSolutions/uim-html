module uim.html.elements.em;

import uim.html;

class DH5EM : DH5Obj {
	mixin(H5This!"EM");
}
mixin(FuncH5!"EM");

unittest {
	

	assert(H5EM == "<em></em>");
}

