module uim.html.elements.menuitem;

@safe:
import uim.html;

class DH5Menuitem : DH5Obj {
	mixin(H5This!"menuitem");
}
mixin(H5Short!"Menuitem");

unittest {
  version(uim_html) {
    assert(Assert(H5Menuitem, "<menuitem></menuitem>"));
}}
