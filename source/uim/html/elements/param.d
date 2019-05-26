module uim.html.elements.param;

import uim.html;

class DH5PARAM : DH5Obj {
	mixin(H5This!"PARAM");
}
mixin(FuncH5!"PARAM");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5PARAM.toString == "<param></param>");
}
