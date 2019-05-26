module uim.html.elements.li;

import uim.html;

class DH5LI : DH5Obj {
	mixin(H5This!"LI");

//	mixin(H5ShortCut!"A");
}
mixin(FuncH5!"LI");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5LI == "<li></li>");
}
