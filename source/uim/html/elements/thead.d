module uim.html.elements.thead;

@safe:
import uim.html;

class DH5Thead : DH5Obj {
	mixin(H5This!"thead");

	mixin(MyContent!("tr", "H5Tr"));
	unittest {
		assert(H5Thead.tr,"<thead><tr></tr></thead>"));
	}

	mixin(MyContent!("row", "H5Tr"));
	unittest {
	  version(test_uim_html) {
			assert(H5Thead.row,"<thead><tr></tr></thead>"));
	}}
}
mixin(H5Short!"Thead");

unittest {
    assert(H5Thead,"<thead></thead>"));
}}
