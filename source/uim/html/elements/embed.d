module uim.html.elements.embed;

import uim.html;

class DH5EMBED : DH5Obj {
	mixin(H5This!"EMBED");
}
mixin(FuncH5!"EMBED");

unittest {
	
	
	assert(H5EMBED == "<embed></embed>");
}
