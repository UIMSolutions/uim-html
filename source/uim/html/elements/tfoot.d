module uim.html.elements.tfoot;

@safe:
import uim.html;

class DH5Tfoot : DH5Obj {
	mixin(H5This!"tfoot");

	mixin(MyContent!("tr", "H5Tr"));
	unittest {
	  version(test_uim_html) {
			assert(H5Tfoot.tr == "<tfoot><tr></tr></tfoot>");
	}}

	mixin(MyContent!("row", "H5Tr"));
	unittest {
	  version(test_uim_html) {
			assert(H5Tfoot.row == "<tfoot><tr></tr></tfoot>");
	}}
}
mixin(H5Short!"Tfoot");

unittest {
    assert(H5Tfoot == "<tfoot></tfoot>");
}
