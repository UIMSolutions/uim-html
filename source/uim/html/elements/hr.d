module uim.html.elements.hr;

import uim.html;

class DH5HR : DH5Obj {
	mixin(H5This!"HR");
}
mixin(FuncH5!"HR");
alias HR = H5HR;

unittest {
	
	
	assert(H5HR == "<hr></hr>");
}
