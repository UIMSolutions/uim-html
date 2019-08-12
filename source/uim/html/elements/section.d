module uim.html.elements.section;

import uim.html;

class DH5SECTION : DH5Obj {
	mixin(H5This!("SECTION"));
}
mixin(FuncH5!"SECTION");

unittest {
	
	
	assert(H5SECTION == "<section></section>");
}
