﻿module uim.html.elements.samp;

@safe:
import uim.html;

class DH5Samp : DH5Obj {
	mixin(H5This!"samp");
}
mixin(H5Short!"Samp");

unittest {
  version(uim_html) {
    assert(Assert(H5Samp,"<samp></samp>"));
}}
