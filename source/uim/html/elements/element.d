module uim.html.elements.element;

import uim.html;

class DH5Element : DH5Obj {
	mixin(H5This!"element");
}
mixin(H5Short!"Element");

unittest {
	assert(Assert(H5Element,"<element></element>"));
}