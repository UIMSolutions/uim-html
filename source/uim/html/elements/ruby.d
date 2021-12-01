module uim.html.elements.ruby;

import uim.html; 

class DH5Ruby : DH5Obj {
	mixin(H5This!"ruby");
}
mixin(H5Short!"Ruby");

unittest {
  version(uim_html) {
    assert(Assert(H5Ruby,"<ruby></ruby>"));
}}
