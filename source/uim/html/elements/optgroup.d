﻿module uim.html.elements.optgroup;

import uim.html;

class DH5OPTGROUP : DH5Obj {
	mixin(H5This!"OPTGROUP");

//	O option(this O)() {
//
//	}
}
mixin(FuncH5!"OPTGROUP");

unittest {
	
	
	assert(H5OPTGROUP == "<optgroup></optgroup>");
}
