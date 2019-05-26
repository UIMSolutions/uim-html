module uim.html.elements.svg;

import uim.html;

class DH5SVG : DH5Obj {
	mixin(H5This!"SVG");
}
mixin(FuncH5!"SVG");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5SVG == "<svg></svg>");
}
