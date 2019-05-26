module uim.html.elements.embed;

import uim.html;

class DH5EMBED : DH5Obj {
	mixin(H5This!"EMBED");
}
mixin(FuncH5!"EMBED");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5EMBED == "<embed></embed>");
}
