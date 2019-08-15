module uim.html.elements.thead;

import uim.html;

class DH5Thead : DH5Obj {
	mixin(H5This!"thead");
	mixin(MyContent!("row", "H5Tr"));
}
mixin(FuncH5!"Thead");

unittest {
	assert(H5Thead == "<thead></thead>");
}
