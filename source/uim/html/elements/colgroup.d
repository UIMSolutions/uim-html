module uim.html.elements.colgroup;

import uim.html;

@safe class DH5Colgroup : DH5Obj {
	mixin(H5This!"Colgroup");
}
mixin(H5Short!"Colgroup");

unittest {
	assert(Assert(H5Colgroup,"<colgroup></colgroup>"));
}
