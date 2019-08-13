module uim.html.elements.header;

import uim.html;

class DH5Header : DH5Obj {
	mixin(H5This!("header"));
}
mixin(FuncH5!"Header");

unittest {
	
	
	assert(H5Header == "<header></header>");
}
