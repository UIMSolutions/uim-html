module uim.html.elements.param;

@safe:
import uim.html;

class DH5Param : DH5Obj {
	mixin(H5This!"param");
}
mixin(H5Short!"Param");

unittest {
  version(uim_html) {
    assert(Assert(H5Param, "<param></param>"));
}}
