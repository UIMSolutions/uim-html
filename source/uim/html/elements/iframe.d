module uim.html.elements.iframe;

@safe:
import uim.html;

class DH5Iframe : DH5Obj {
	mixin(H5This!"iframe");
}
mixin(H5Short!"Iframe");

unittest {
  version(uim_html) {
    assert(Assert(H5Iframe, "<iframe></iframe>"));
}}
