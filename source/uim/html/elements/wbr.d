﻿module uim.html.elements.wbr;

@safe:
import uim.html;

class DH5Wbr : DH5Obj {
	mixin(H5This!"wbr");
}
mixin(H5Short!"Wbr");

unittest {
	mixin(H5Test!("H5Wbr", "wbr"));
}
