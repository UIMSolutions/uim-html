﻿module uim.html.elements.header;

import uim.html;

@safe class DH5Header : DH5Obj {
	mixin(H5This!("header"));
}
mixin(H5Short!"Header");

unittest {
	assert(Assert(H5Header,"<header></header>"));
}
