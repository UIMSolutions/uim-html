module uim.html.elements.data;

import uim.html;

class DH5Data : DH5Obj {
	mixin(H5This!"data");
}
mixin(H5Short!"Data");

unittest {
	assert(H5Data == "<data></data>");
}
