module uim.html.elements.tr;

import uim.html;

class DH5Tr : DH5Obj {
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
mixin(H5Short!"Tr");

unittest {
	assert(Assert(H5Tr, "<tr></tr>"));
}
