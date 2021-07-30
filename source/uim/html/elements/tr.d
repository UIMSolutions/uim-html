module uim.html.elements.tr;
@safe:
import uim.html;

@safe class DH5Tr : DH5Obj {
	mixin(H5This!"tr");

	mixin(MyContent!("th", "H5Th"));
	unittest {
		assert(Assert(H5Tr.th, "<tr><th></th></tr>"));
	}

	mixin(MyContent!("td", "H5Td"));
	unittest {
		assert(Assert(H5Tr.td, "<tr><td></td></tr>"));
	}

	mixin(MyContent!("cell", "H5Td"));
	unittest {
		assert(Assert(H5Tr.cell, "<tr><td></td></tr>"));
	}
}
mixin(H5Calls!("H5Tr", "DH5Tr"));

unittest {
	assert(Assert(H5Tr, "<tr></tr>"));
	assert(Assert(H5Tr.td, "<tr><td></td></tr>"));
	assert(Assert(H5Tr.cell, "<tr><td></td></tr>"));
	assert(Assert(H5Tr(H5Td), "<tr><td></td></tr>"));
	assert(Assert(H5Tr(H5.td), "<tr><td></td></tr>"));
}
