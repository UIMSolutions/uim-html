module uim.html.elements.img;

import uim.html;

class DH5IMG : DH5Obj {
	mixin(H5This!("IMG", null, null, true));
}
mixin(FuncH5!("IMG"));

unittest {
	
	
	assert(H5IMG == "<img>");
}
