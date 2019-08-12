module uim.html.elements.sub;

import uim.html;

class DH5SUB : DH5Obj {
	mixin(H5This!"SUB");
}
mixin(FuncH5!"SUB");

unittest {
	
	
	assert(H5SUB == "<sub></sub>");
}
