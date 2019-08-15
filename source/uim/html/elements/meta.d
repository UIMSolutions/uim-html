module uim.html.elements.meta;

import uim.html;

class DH5Meta : DH5Obj {
	mixin(H5This!("meta", null, null, true));
}
mixin(FuncH5!("Meta"));

unittest {
	assert(H5Meta == "<meta>");
}
