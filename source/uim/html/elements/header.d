﻿module uim.html.elements.header;

import uim.html;

class DH5HEADER : DH5Obj {
	mixin(H5This!("HEADER"));
}
mixin(FuncH5!"HEADER");

unittest {
	
	
	assert(H5HEADER == "<header></header>");
}
