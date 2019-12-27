module uim.html.elements.output;

import uim.html;

class DH5Output : DH5Obj {
	mixin(H5This!"output");
}
mixin(H5Short!"Output");

unittest {
	assert(Assert(H5Output,"<output></output>"));
}
