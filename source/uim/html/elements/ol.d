module uim.html.elements.ol;

@safe:
import uim.html;

class DH5Ol : DH5Obj {
	mixin(H5This!"ol");

	mixin(MyContent!("item", "H5Li"));
	unittest {
		assert(Assert(H5Ol.item,"<ol><li></li></ol>"));
	}
}
mixin(H5Short!"Ol");
unittest {
  version(test_uim_html) {
    assert(Assert(H5Ol,"<ol></ol>"));
}}
