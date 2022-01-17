module uim.html.elements.i;

@safe:
import uim.html;

class DH5I : DH5Obj {
	mixin(H5This!"I");
}
mixin(H5Short!"I");

unittest {
  version(test_uim_html) {
    assert(H5I == "<i></i>");
}}
