module uim.html.elements.colgroup;

@safe:
import uim.html;

class DH5Colgroup : DH5Obj {
	mixin(H5This!"Colgroup");
}
mixin(H5Short!"Colgroup");

unittest {
  version(uim_html) {
    assert(Assert(H5Colgroup,"<colgroup></colgroup>"));
    }}
