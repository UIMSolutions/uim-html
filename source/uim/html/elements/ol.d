module uim.html.elements.ol;

import uim.html;

class DH5OL : DH5Obj {
	mixin(H5This!"OL");

//	mixin(H5ShortCut!"LI");
//	DH5A LIA(T...)(T values) {
//		auto a = H5A(values);
//		add(H5LI(a));
//		return a;
//	}
}
mixin(FuncH5!"OL");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5OL == "<ol></ol>");
}
