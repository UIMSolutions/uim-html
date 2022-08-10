module uim.html.elements.ins;

@safe:
import uim.html;

class DH5Ins : DH5Obj {
	mixin(H5This!"ins");
}
mixin(H5Short!"Ins");

unittest {
  version(test_uim_html) {
    assert(H5Ins, "<ins></ins>"));
}}
