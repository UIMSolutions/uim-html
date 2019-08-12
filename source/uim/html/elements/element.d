module uim.html.elements.element;

import uim.html;

class DH5ELEMENT : DH5Obj {
	mixin(H5This!"ELEMENT");
}
mixin(FuncH5!"ELEMENT");

unittest {
	

	assert(H5ELEMENT == "<element></element>");
}