module uim.html.elements.dt;

import uim.html;

class DH5DT : DH5Obj {
	mixin(H5This!"DT");
}
mixin(FuncH5!"DT");

unittest {
	

	assert(H5DT == "<dt></dt>");
}