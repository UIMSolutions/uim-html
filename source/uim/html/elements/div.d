module uim.html.elements.div;

import uim.html;

class DH5Div : DH5Obj {
	mixin(H5This!"Div");
}
mixin(FuncH5!"Div");

unittest {
	assert(H5Div == "<div></div>");
	assert(H5Div("content") == `<div>content</div>`);
}
