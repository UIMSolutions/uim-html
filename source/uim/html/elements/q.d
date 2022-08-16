﻿module uim.html.elements.q;

@safe:
import uim.html;

// Wrapper for <q> - indicates that the enclosed text is a short inline quotation.
class DH5Q : DH5Obj {
	mixin(H5This!"Q");
}
mixin(H5Short!"Q");

version(test_uim_html) { unittest {
  // testH5Obj(H5Q, "q");
}}
