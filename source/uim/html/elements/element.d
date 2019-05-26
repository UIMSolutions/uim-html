module uim.html.elements.element;

import uim.html;

class DH5ELEMENT : DH5Obj {
	mixin(H5This!"ELEMENT");
}
mixin(FuncH5!"ELEMENT");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5ELEMENT == "<element></element>");
}