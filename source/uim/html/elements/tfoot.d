module uim.html.elements.tfoot;

@safe:
import uim.html;

class DH5Tfoot : DH5Obj {
	mixin(H5This!"tfoot");

	mixin(MyContent!("tr", "H5Tr"));
	version(test_uim_html) { unittest {
			assert(H5Tfoot.tr == "<tfoot><tr></tr></tfoot>");
	}}

	mixin(MyContent!("row", "H5Tr"));
	version(test_uim_html) { unittest {
			assert(H5Tfoot.row == "<tfoot><tr></tr></tfoot>");
	}}
}
mixin(H5Short!"Tfoot");

version(test_uim_html) { unittest {
    assert(H5Tfoot == "<tfoot></tfoot>");
}}
