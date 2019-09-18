module uim.html.elements.dialog;

import uim.html;

class DH5Dialog : DH5Obj {
	mixin(H5This!"dialog");
}
mixin(H5Short!"Dialog");

unittest {
	

	assert(H5Dialog == "<dialog></dialog>");
}
