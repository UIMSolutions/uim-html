module uim.html.elements.dt;

@safe:
import uim.html;

class DH5Dt : DH5Obj {
	mixin(H5This!"dt");
}
mixin(H5Short!"Dt");

unittest {
  version(test_uim_html) {
    assert(H5Dt,"<dt></dt>"));
}}