module uim.html.elements.ruby;

import uim.html; 

class DH5RUBY : DH5Obj {
	mixin(H5This!"RUBY");
}
mixin(FuncH5!"RUBY");

unittest {
	
	
	assert(H5RUBY == "<ruby></ruby>");
}
