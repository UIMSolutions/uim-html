module uim.html.elements.datalist;

import uim.html;

class DH5Datalist : DH5Obj {
	mixin(H5This!"datalist");
}
mixin(FuncH5!"Datalist");

unittest {
	assert(H5Datalist == "<datalist></datalist>");
}
