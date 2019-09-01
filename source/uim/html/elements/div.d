module uim.html.elements.div;

import uim.html;

class DH5Div : DH5Obj {
	mixin(H5This!"div");
}
mixin(H5Short!"Div");

unittest {
	assert(H5Div == "<div></div>");
	assert(H5Div("content") == `<div>content</div>`);
}
