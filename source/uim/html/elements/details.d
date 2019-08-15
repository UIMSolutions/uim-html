module uim.html.elements.details;

import uim.html;

class DH5Details: DH5Obj {
	mixin(H5This!"details");
}
mixin(FuncH5!"Details");

unittest {
	assert(H5Details == "<details></details>");
}
