﻿module uim.html.elements.sub;

import uim.html;

class DH5Sub : DH5Obj {
	mixin(H5This!"sub");
}
mixin(H5Short!"Sub");

unittest {
	assert(H5Sub == "<sub></sub>");
}
