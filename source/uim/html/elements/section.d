﻿module uim.html.elements.section;

@safe:
import uim.html;

class DH5Section : DH5Obj {
	mixin(H5This!("section"));
}
mixin(H5Short!"Section");

version(test_uim_html) { unittest {
    // testH5Obj(H5Section, "section");
}}
