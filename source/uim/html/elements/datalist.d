module uim.html.elements.datalist;

import uim.html;

class DH5DATALIST : DH5Obj {
	mixin(H5This!"DATALIST");
}
mixin(FuncH5!"DATALIST");

unittest {
	

	assert(H5DATALIST == "<datalist></datalist>");
}
