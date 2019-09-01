module uim.html.elements.tbody;

import uim.html;

class DH5Tbody : DH5Obj {
	mixin(H5This!"tbody");
	
	mixin(MyContent!("tr", "H5Tr"));
}
mixin(H5Short!"Tbody");

unittest {
	assert(H5Tbody == "<tbody></tbody>");
}
