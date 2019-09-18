module uim.html.elements.em;

import uim.html;

class DH5Em: DH5Obj {
	mixin(H5This!"em");
}
mixin(H5Short!"Em");

unittest {
	assert(H5Em == "<em></em>");
}

