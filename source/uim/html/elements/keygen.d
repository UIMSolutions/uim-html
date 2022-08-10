module uim.html.elements.keygen;

@safe:
import uim.html;

class DH5Keygen : DH5Obj {
	mixin(H5This!"keygen");
}
mixin(H5Short!"Keygen");

unittest {
  version(test_uim_html) {
    assert(H5Keygen,"<keygen></keygen>"));
}}
