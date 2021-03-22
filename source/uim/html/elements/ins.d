module uim.html.elements.ins;

import uim.html;

@safe class DH5Ins : DH5Obj {
	mixin(H5This!"ins");
}
mixin(H5Short!"Ins");

unittest {
	assert(Assert(H5Ins, "<ins></ins>"));
}
