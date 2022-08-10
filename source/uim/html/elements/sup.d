module uim.html.elements.sup;

@safe:
import uim.html;

class DH5Sup : DH5Obj {
	mixin(H5This!"sup");
}
mixin(H5Short!"Sup");

unittest {
  version(test_uim_html) {
    assert(H5Sup, "<sup></sup>"));
}}
