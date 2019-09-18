module uim.html.elements.header;

import uim.html;

class DH5Header : DH5Obj {
	mixin(H5This!("header"));
}
mixin(H5Short!"Header");

unittest {
	
	
	assert(H5Header == "<header></header>");
}
