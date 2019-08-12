module uim.html.elements.span;

import uim.html;

class DH5SPAN : DH5Obj {
	mixin(H5This!"SPAN");
}
mixin(FuncH5!"SPAN");

unittest {
	
	
	assert(H5SPAN == "<span></span>");
}
