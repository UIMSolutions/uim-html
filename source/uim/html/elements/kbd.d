module uim.html.elements.kbd;

import uim.html;

class DH5KBD : DH5Obj {
	mixin(H5This!"KBD");
}
mixin(FuncH5!"KBD");

unittest {
	
	
	assert(H5KBD == "<kbd></kbd>");
}
