module uim.html.elements.bdo;

import uim.html;

class DH5BDO : DH5Obj {
	mixin(H5This!"BDO");
}
mixin(FuncH5!"BDO");

unittest {
	

	assert(H5BDO == "<bdo></bdo>");
}
