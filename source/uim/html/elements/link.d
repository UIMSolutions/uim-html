module uim.html.elements.link;

import uim.html;

class DH5Link : DH5Obj {
mixin(H5This!("link", null, null, true));
}
mixin(H5Short!("Link"));

unittest {
	assert(Assert(H5Link,"<link>"));
}
