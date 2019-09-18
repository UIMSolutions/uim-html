module uim.html.elements.mark;

import uim.html;

/// HTML5 "mark" class
class DH5Mark : DH5Obj {
	mixin(H5This!"Mark");
}
mixin(H5Short!"Mark");

unittest {
	
	
	assert(H5Mark == "<mark></mark>");
}
