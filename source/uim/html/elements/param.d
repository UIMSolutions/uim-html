﻿module uim.html.elements.param;

import uim.html;

class DH5Param : DH5Obj {
	mixin(H5This!"param");
}
mixin(H5Short!"Param");

unittest {
	
	
	assert(H5Param == "<param></param>");
}
