module uim.html.elements.s;

import uim.html; 

class DH5S : DH5Obj {
	mixin(H5This!"S");
}
mixin(FuncH5!"S");

unittest {
	
	
	assert(H5S == "<s></s>");
}
