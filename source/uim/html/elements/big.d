module uim.html.elements.big;

import uim.html;

class DH5Big : DH5Obj {
	mixin(H5This!"Big");
}
mixin(H5Short!"Big");

unittest {
	assert(H5Big == "<big></big>");
}

