module uim.html.elements.section;

import uim.html;

class DH5Section : DH5Obj {
	mixin(H5This!("section"));
}
mixin(FuncH5!"Section");

unittest {
	assert(H5Section == "<section></section>");
}
