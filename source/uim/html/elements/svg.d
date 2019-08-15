module uim.html.elements.svg;

import uim.html;

class DH5Svg : DH5Obj {
	mixin(H5This!"svg");
}
mixin(FuncH5!"Svg");

unittest {
	assert(H5Svg == "<svg></svg>");
}
