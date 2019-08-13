module uim.html.elements.var;

import uim.html;

class DH5Var : DH5Obj {
	mixin(H5This!"var");
}
mixin(FuncH5!"Var");

unittest {
	assert(H5Var == "<var></var>");
}
