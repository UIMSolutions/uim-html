module uim.html.elements.hr;

import uim.html;

class DH5Hr : DH5Obj {
	mixin(H5This!"hr");
}
mixin(FuncH5!"Hr");
alias Hr = H5Hr;

unittest {
	
	
	assert(H5Hr == "<hr></hr>");
}
