﻿module uim.html.elements.svg;

@safe:
import uim.html;

class DH5Svg : DH5Obj {
	mixin(H5This!"svg");
}
mixin(H5Short!"Svg");

version(test_uim_html) { unittest {
    // assert(H5Svg == "<svg></svg>");
}}
