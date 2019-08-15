module uim.html.elements.col;

import uim.html;

class DH5Col : DH5Obj {
	mixin(H5This!"col");
}
mixin(FuncH5!"Col");

unittest {
	assert(H5Col == "<col></col>");
}
