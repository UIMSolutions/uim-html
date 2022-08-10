module uim.html.elements.rbc;

@safe:
import uim.html;

class DH5Rbc : DH5Obj {
	mixin(H5This!"rbc");
}
mixin(H5Short!"Rbc");

unittest {
  version(test_uim_html) {
    assert(H5Rbc,"<rbc></rbc>"));
}}
