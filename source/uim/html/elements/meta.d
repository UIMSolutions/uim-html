module uim.html.elements.meta;

import uim.html;

class DH5Meta : DH5Obj {
	mixin(H5This!("meta", null, null, true));
}
mixin(H5Short!("Meta"));

unittest {
	assert(Assert(H5Meta, "<meta>"));
}
