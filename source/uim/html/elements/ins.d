module uim.html.elements.ins;

import uim.html;

class DH5INS : DH5Obj {
	mixin(H5This!"INS");
}
mixin(FuncH5!"INS");

unittest {
	
	
	assert(H5INS == "<ins></ins>");
}
