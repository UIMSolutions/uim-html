module uim.html.elements.bdo;

import uim.html;

class DH5BDO : DH5Obj {
	mixin(H5This!"BDO");
}
mixin(FuncH5!"BDO");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5BDO == "<bdo></bdo>");
}
