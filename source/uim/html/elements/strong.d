module uim.html.elements.strong;

import uim.html;

class DH5Strong : DH5Obj {
	mixin(H5This!"strong");
}
mixin(FuncH5!"Strong");

unittest {
	
	
	assert(H5Strong == "<strong></strong>");
}
