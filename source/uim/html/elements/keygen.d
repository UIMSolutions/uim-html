﻿module uim.html.elements.keygen;

@safe:
import uim.html;

class DH5Keygen : DH5Obj {
	mixin(H5This!"keygen");
}
mixin(H5Short!"Keygen");

unittest {
  version(uim_html) {
    assert(Assert(H5Keygen,"<keygen></keygen>"));
}}
