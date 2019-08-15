module uim.html.elements.output;

import uim.html;

class DH5Output : DH5Obj {
	mixin(H5This!"output");
}
mixin(FuncH5!"Output");

unittest {
	assert(H5Output == "<output></output>");
}
