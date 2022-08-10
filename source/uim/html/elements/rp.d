module uim.html.elements.rp;

@safe:
import uim.html;

class DH5Rp : DH5Obj {
	mixin(H5This!"rp");
}
mixin(H5Short!"Rp");

unittest {
  version(test_uim_html) {
    assert(H5Rp,"<rp></rp>"));
}}