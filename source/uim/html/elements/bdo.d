module uim.html.elements.bdo;

import uim.html;

class DH5Bdo : DH5Obj {
	mixin(H5This!"bdo");
}
mixin(FuncH5!"Bdo");

unittest {
	assert(H5Bdo == "<bdo></bdo>");
}
