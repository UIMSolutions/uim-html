module uim.html.elements.caption;

import uim.html;

class DH5Caption : DH5Obj {
	mixin(H5This!"caption");
}
mixin(FuncH5!"Caption");

unittest {
	assert(H5Caption == "<caption></caption>");
}
