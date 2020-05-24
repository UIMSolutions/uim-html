module uim.html.elements.details;

import uim.html;

class DH5Details: DH5Obj {
	mixin(H5This!"details");
}
mixin(H5Short!"Details");

unittest {
	assert(Assert(H5Details,"<details></details>"));
}
