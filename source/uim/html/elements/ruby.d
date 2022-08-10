module uim.html.elements.ruby;

import uim.html; 

class DH5Ruby : DH5Obj {
	mixin(H5This!"ruby");
}
mixin(H5Short!"Ruby");

unittest {
  version(test_uim_html) {
    assert(H5Ruby,"<ruby></ruby>"));
}}
