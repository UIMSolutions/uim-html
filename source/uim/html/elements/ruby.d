module uim.html.elements.ruby;

import uim.html; 

class DH5Ruby : DH5Obj {
	mixin(H5This!"ruby");
}
mixin(FuncH5!"Ruby");

unittest {
	
	
	assert(H5Ruby == "<ruby></ruby>");
}
