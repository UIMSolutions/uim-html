﻿module uim.html.elements.menu;

import uim.html;

class DH5Menu : DH5Obj {
	mixin(H5This!"menu");
}
mixin(H5Short!"Menu");

unittest {
	assert(H5Menu == "<menu></menu>");
}
