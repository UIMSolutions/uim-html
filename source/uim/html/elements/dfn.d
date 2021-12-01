module uim.html.elements.dfn;

@safe:
import uim.html;

class DH5Dfn : DH5Obj {
	mixin(H5This!"dfn");
}
mixin(H5Short!"Dfn");

unittest {
  version(uim_html) {
    assert(Assert(H5Dfn,"<dfn></dfn>"));
}}
