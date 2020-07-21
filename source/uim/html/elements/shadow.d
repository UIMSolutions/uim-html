module uim.html.elements.shadow;

import uim.html;

class DH5Shadow : DH5Obj {
	mixin(H5This!"shadow");
}
mixin(H5Short!"Shadow");

unittest {
	assert(Assert(H5Shadow, "<shadow></shadow>"));
}
