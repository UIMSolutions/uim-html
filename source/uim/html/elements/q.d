module uim.html.elements.q;

import uim.html;

class DH5Q : DH5Obj {
	mixin(H5This!"Q");
}
mixin(H5Short!"Q");

unittest {
	assert(Assert(H5Q, "<q></q>"));
}
