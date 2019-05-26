module uim.html.elements.kbd;

import uim.html;

class DH5KBD : DH5Obj {
	mixin(H5This!"KBD");
}
mixin(FuncH5!"KBD");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5KBD == "<kbd></kbd>");
}
