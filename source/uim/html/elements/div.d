module uim.html.elements.div;

import uim.html;

class DH5Div : DH5Obj {
	mixin(H5This!"div");
}
mixin(H5Short!"Div");

unittest {
	assert(Assert(H5Div,"<div></div>"));
	assert(Assert(H5Div("content"),`<div>content</div>`));
}
