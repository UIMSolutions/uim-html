module uim.html.elements.caption;

import uim.html;

class DH5CAPTION : DH5Obj {
	mixin(H5This!"CAPTION");
}
mixin(FuncH5!"CAPTION");

unittest {
	

	assert(H5CAPTION == "<caption></caption>");
}
