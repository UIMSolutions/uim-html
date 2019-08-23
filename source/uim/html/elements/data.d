module uim.html.elements.data;

import uim.html;

class DH5Data : DH5Obj {
	mixin(H5This!"data");
}
mixin(FuncH5!"Data");

unittest {
	assert(H5Data == "<data></data>");
}
