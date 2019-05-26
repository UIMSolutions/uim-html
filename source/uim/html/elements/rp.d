module uim.html.elements.rp;

import uim.html;

class DH5RP : DH5Obj {
	mixin(H5This!"RP");
}
mixin(FuncH5!"RP");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5RP == "<rp></rp>");
}
