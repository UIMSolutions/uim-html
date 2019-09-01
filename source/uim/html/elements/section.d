module uim.html.elements.section;

import uim.html;

class DH5Section : DH5Obj {
	mixin(H5This!("section"));
}
mixin(H5Short!"Section");

unittest {
	assert(H5Section == "<section></section>");
}
