﻿module uim.html.elements.sub;

@safe:
import uim.html;

class DH5Sub : DH5Obj {
	mixin(H5This!"sub");
}
mixin(H5Short!"Sub");

version(test_uim_html) { unittest {
    // assert(H5Sub == "<sub></sub>");
}}
