module uim.html.elements.meta;

import uim.html;

class DH5META : DH5Obj {
	mixin(H5This!("META", null, null, true));
}
mixin(FuncH5!("META"));

unittest {
	
	
	assert(H5META == "<meta>");
}
