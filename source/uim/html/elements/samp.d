module uim.html.elements.samp;

@safe:
import uim.html;

class DH5Samp : DH5Obj {
	mixin(H5This!"samp");
}
mixin(H5Short!"Samp");

unittest {
  version(test_uim_html) {
    assert(H5Samp,"<samp></samp>"));
}}
