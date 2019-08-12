module uim.html.elements.sup;

import uim.html;

class DH5SUP : DH5Obj {
	mixin(H5This!"SUP");
}
mixin(FuncH5!"SUP");

unittest {
	
	
	assert(H5SUP == "<sup></sup>");
}
