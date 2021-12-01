module uim.html.elements.cite;

@safe:
import uim.html;

class DH5Cite : DH5Obj {
	mixin(H5This!"cite");
}
mixin(H5Short!"Cite");

unittest {
  version(uim_html) {
    assert(Assert(H5Cite,"<cite></cite>"));
    }}

