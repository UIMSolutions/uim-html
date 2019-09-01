module uim.html.elements.strong;

import uim.html;

class DH5Strong : DH5Obj {
	mixin(H5This!"strong");
}
mixin(H5Short!"Strong");

unittest {
	
	
	assert(H5Strong == "<strong></strong>");
}
