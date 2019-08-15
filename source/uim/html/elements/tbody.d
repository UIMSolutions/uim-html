module uim.html.elements.tbody;

import uim.html;

class DH5Tbody : DH5Obj {
	mixin(H5This!"tbody");
	mixin(MyContent!("row", "H5Tr"));
}
mixin(H5Short!"H5Tbody");

unittest {
	assert(H5Tbody == "<tbody></tbody>");
}
