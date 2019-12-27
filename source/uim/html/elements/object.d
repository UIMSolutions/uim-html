module uim.html.elements.object;

import uim.html;

class DH5Object : DH5Obj {
	mixin(H5This!"object");
}
mixin(H5Short!"Object");

unittest {
	assert(Assert(H5Object, "<object></object>"));
}
