module uim.html.elements.tr;

import uim.html;

class DH5Tr : DH5Obj {
	mixin(H5This!"tr");

//	mixin(H5ShortCut!"TH");
//	mixin(H5ShortCut!"TD");
}
mixin(H5Short!"Tr");

unittest {
	assert(H5Tr == "<tr></tr>");
}
