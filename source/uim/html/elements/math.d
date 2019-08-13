module uim.html.elements.math;

import uim.html;

class DH5Math : DH5Obj {
	mixin(H5This!"math");
}
mixin(FuncH5!"Math");

unittest {
	
	
	assert(H5Math == "<math></math>");
}
