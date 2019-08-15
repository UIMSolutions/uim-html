module uim.html.elements.embed;

import uim.html;

class DH5Embed : DH5Obj {
	mixin(H5This!"embed");
}
mixin(FuncH5!"Embed");

unittest {
	
	
	assert(H5Embed == "<embed></embed>");
}
