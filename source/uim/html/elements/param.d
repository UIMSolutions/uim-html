﻿module uim.html.elements.param;

@safe:
import uim.html;

class DH5Param : DH5Obj {
	mixin(H5This!"param");
}
mixin(H5Short!"Param");

version(test_uim_html) { unittest {
    // testH5Obj(H5Param, "param");
}
