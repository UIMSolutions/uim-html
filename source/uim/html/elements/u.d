module uim.html.elements.u;

import uim.html;

class DH5U : DH5Obj {
	mixin(H5This!"U");
}
mixin(FuncH5!"U");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5U == "<u></u>");
}
