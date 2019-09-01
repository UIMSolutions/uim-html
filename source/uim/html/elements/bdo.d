module uim.html.elements.bdo;

import uim.html;

class DH5Bdo : DH5Obj {
	mixin(H5This!"bdo");
}
mixin(H5Short!"Bdo");

unittest {
	assert(H5Bdo == "<bdo></bdo>");
}
