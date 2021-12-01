module uim.html.elements.aside;

@safe:
import uim.html;

class DH5Aside : DH5Obj {
	mixin(H5This!"aside");
}

mixin(H5Short!"Aside");

unittest {
  version(uim_html) {
    assert(Assert(H5Aside,"<aside></aside>"));
    }}
