module uim.html.elements.datalist;

import uim.html;

class DH5Datalist : DH5Obj {
	mixin(H5This!"datalist");
}
mixin(H5Short!"Datalist");

unittest {
	assert(Assert(H5Datalist,"<datalist></datalist>"));
}
