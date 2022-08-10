﻿module uim.html.elements.picture;

@safe:
import uim.html;

class DH5Picture : DH5Obj {
	mixin(H5This!"picture");
}
mixin(H5Short!"Picture");

unittest {
  version(test_uim_html) {
    assert(H5Picture,"<picture></picture>"));
}}
