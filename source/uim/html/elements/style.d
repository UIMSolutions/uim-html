module uim.html.elements.style;

import uim.html;

class DH5Style : DH5Obj {
	mixin(H5This!("style"));
}
mixin(H5Short!"Style");

unittest {
	assert(H5Style == "<style></style>");
}
