module uim.html.elements.span;

import uim.html;

class DH5Span : DH5Obj {
	mixin(H5This!"Span");
}
mixin(FuncH5!"Span");

unittest {	
	assert(H5Span == "<span></span>");
}
