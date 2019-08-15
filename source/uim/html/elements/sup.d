module uim.html.elements.sup;

import uim.html;

class DH5Sup : DH5Obj {
	mixin(H5This!"sup");
}
mixin(FuncH5!"Sup");

unittest {
	
	
	assert(H5Sup == "<sup></sup>");
}
