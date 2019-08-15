module uim.html.elements.ins;

import uim.html;

class DH5Ins : DH5Obj {
	mixin(H5This!"ins");
}
mixin(FuncH5!"Ins");

unittest {
	assert(H5Ins == "<ins></ins>");
}
