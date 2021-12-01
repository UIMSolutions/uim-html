module uim.html.elements.dt;

@safe:
import uim.html;

class DH5Dt : DH5Obj {
	mixin(H5This!"dt");
}
mixin(H5Short!"Dt");

unittest {
  version(uim_html) {
    assert(Assert(H5Dt,"<dt></dt>"));
}}