﻿module uim.html.elements.sup;

@safe:
import uim.html;

// Wrapper for <sup> - specifies inline text which is to be displayed as superscript for solely typographical reasons. 
class DH5Sup : DH5Obj {
	mixin(H5This!"sup");
}
mixin(H5Short!"Sup");

version(test_uim_html) { unittest {
    assert(H5Sup == "<sup></sup>");
}}
