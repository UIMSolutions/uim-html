﻿module uim.html.elements.iframe;

@safe:
import uim.html;

class DH5Iframe : DH5Obj {
	mixin(H5This!"iframe");
}
mixin(H5Short!"Iframe");

version(test_uim_html) { unittest {
    // assert(H5Iframe == "<iframe></iframe>");
}}
