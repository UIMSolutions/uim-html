﻿module uim.html.elements.template_;

@safe:
import uim.html;

class DH5Template : DH5Obj {
	mixin(H5This!"template");
}
mixin(H5Short!"Template");

unittest {
  version(test_uim_html) {
    assert(H5Template, "<template></template>"));
}}
