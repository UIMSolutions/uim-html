module uim.html.elements.kbd;

@safe:
import uim.html;

class DH5Kbd : DH5Obj {
	mixin(H5This!"kbd");
}
mixin(H5Short!"Kbd");

unittest {
  version(uim_html) {
    assert(Assert(H5Kbd, "<kbd></kbd>"));
}}
