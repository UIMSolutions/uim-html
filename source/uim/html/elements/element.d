module uim.html.elements.element;

import uim.html;

class DH5Element : DH5Obj {
	mixin(H5This!"element");
}
mixin(FuncH5!"Element");

unittest {
	assert(H5Element == "<element></element>");
}