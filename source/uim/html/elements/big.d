module uim.html.elements.big;

import uim.html;

class DH5BIG : DH5Obj {
	mixin(H5This!"BIG");
}
mixin(FuncH5!"BIG");

unittest {
	

	assert(H5BIG == "<big></big>");
}

