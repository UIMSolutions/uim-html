module uim.html.elements.shadow;

import uim.html;

class DH5Shadow : DH5Obj {
	mixin(H5This!"shadow");
}
mixin(FuncH5!"Shadow");

unittest {
	
	
	assert(H5Shadow == "<shadow></shadow>");
}
