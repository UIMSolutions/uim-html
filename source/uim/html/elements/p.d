module uim.html.elements.p;

import uim.html;

class DH5P : DH5Obj {
	mixin(H5This!("P"));
}
mixin(H5Short!"P");

unittest {
	assert(Assert(H5P, "<p></p>"));
}

