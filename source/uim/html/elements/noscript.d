module uim.html.elements.noscript;

@safe:
import uim.html;

class DH5Noscript : DH5Obj {
	mixin(H5This!("noscript"));
}
mixin(H5Short!"Noscript");

unittest {
  version(uim_html) {
    assert(Assert(H5Noscript,"<noscript></noscript>"));
}}
