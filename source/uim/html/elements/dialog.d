module uim.html.elements.dialog;

import uim.html;

class DH5Dialog : DH5Obj {
	mixin(H5This!"dialog");
}
mixin(FuncH5!"Dialog");

unittest {
	

	assert(H5Dialog == "<dialog></dialog>");
}
