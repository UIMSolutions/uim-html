module uim.html.elements.svg;

import uim.html;

class DH5SVG : DH5Obj {
	mixin(H5This!"SVG");
}
mixin(FuncH5!"SVG");

unittest {
	
	
	assert(H5SVG == "<svg></svg>");
}
