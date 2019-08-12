module uim.html.elements.col;

import uim.html;

class DH5COL : DH5Obj {
	mixin(H5This!"COL");
}
mixin(FuncH5!"COL");

unittest {
	

	assert(H5COL == "<col></col>");
}
