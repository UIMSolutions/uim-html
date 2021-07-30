module uim.html.elements.thead;
@safe:
import uim.html;

@safe class DH5Thead : DH5Obj {
	mixin(H5This!"thead");

	mixin(MyContent!("tr", "H5Tr"));
	unittest {
		assert(Assert(H5Thead.tr,"<thead><tr></tr></thead>"));
	}

	mixin(MyContent!("row", "H5Tr"));
	unittest {
		assert(Assert(H5Thead.row,"<thead><tr></tr></thead>"));
	}
}
mixin(H5Short!"Thead");

unittest {
	assert(Assert(H5Thead,"<thead></thead>"));
}
