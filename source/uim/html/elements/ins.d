﻿module uim.html.elements.ins;

@safe:
import uim.html;

class DH5Ins : DH5Obj {
	mixin(H5This!"ins");
}
mixin(H5Short!"Ins");

unittest {
  version(uim_html) {
    assert(Assert(H5Ins, "<ins></ins>"));
}}
