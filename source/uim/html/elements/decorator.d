﻿module uim.html.elements.decorator;

import uim.html;

class DH5Decorator : DH5Obj {
	mixin(H5This!("decorator"));
}
mixin(H5Short!"Decorator");

unittest {
	assert(H5Decorator == "<decorator></decorator>");
}
