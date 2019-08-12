module uim.html.elements.var;

import uim.html;

class DH5VAR : DH5Obj {
	mixin(H5This!"VAR");
}
mixin(FuncH5!"VAR");

unittest {
	
	
	assert(H5VAR == "<var></var>");
}
