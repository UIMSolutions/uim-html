module uim.html.elements.rt;

@safe:
import uim.html;

class DH5Rt : DH5Obj {
	mixin(H5This!"rt");
}
mixin(H5Short!"Rt");

unittest {
  version(uim_html) {
    assert(Assert(H5Rt,"<rt></rt>"));
}}
