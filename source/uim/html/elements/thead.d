module uim.html.elements.thead;

import uim.html;

class DH5Thead : DH5Obj {
	mixin(H5This!"thead");

	mixin(MyContent!("tr", "H5Tr"));
}
mixin(H5Short!"Thead");

unittest {
	assert(H5Thead == "<thead></thead>");
}
