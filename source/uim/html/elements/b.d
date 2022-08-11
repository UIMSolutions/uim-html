﻿module uim.html.elements.b;

@safe:
import uim.html;

// Wrapper for the <b> tag - specifies bold text.
class DH5B : DH5Obj {
	mixin(H5This!"b");
}	
mixin(H5Short!"B");

version(test_uim_html) { unittest {
  // testH5Obj(H5B, "b");
}}

