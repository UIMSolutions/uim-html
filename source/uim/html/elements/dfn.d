module uim.html.elements.dfn;

@safe:
import uim.html;

class DH5Dfn : DH5Obj {
	mixin(H5This!"dfn");
}
mixin(H5Short!"Dfn");

unittest {
  version(test_uim_html) {
    assert(H5Dfn,"<dfn></dfn>"));
}}
