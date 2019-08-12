module uim.html.elements.del;

import uim.html;

class DH5DEL : DH5Obj {
	mixin(H5This!"DEL");
}
mixin(FuncH5!"DEL");

unittest {
	

	assert(H5DEL == "<del></del>");
}
