module uim.html.elements.li;

import uim.html;

class DH5Li : DH5Obj {
	mixin(H5This!"li");

//	mixin(H5ShortCut!"A");
}
mixin(H5Short!"Li");

unittest {
	
	
	assert(H5Li == "<li></li>");
}
