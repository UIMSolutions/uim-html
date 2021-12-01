module uim.html.elements.rbc;

@safe:
import uim.html;

class DH5Rbc : DH5Obj {
	mixin(H5This!"rbc");
}
mixin(H5Short!"Rbc");

unittest {
  version(uim_html) {
    assert(Assert(H5Rbc,"<rbc></rbc>"));
}}
