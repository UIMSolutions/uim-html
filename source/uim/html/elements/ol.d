module uim.html.elements.ol;

import uim.html;

class DH5Ol : DH5Obj {
	mixin(H5This!"ol");

//	mixin(H5ShortCut!"LI");
//	DH5A LIA(T...)(T values) {
//		auto a = H5A(values);
//		add(H5LI(a));
//		return a;
//	}
}
mixin(H5Short!"Ol");

unittest {
	
	
	assert(H5Ol == "<ol></ol>");
}
