module uim.html.elements.object;

import uim.html;

class DH5Object : DH5Obj {
	mixin(H5This!"object");
}
mixin(FuncH5!"Object");

unittest {
	assert(H5Object == "<object></object>");
}
