module uim.html.elements.noscript;

import uim.html;

class DH5NOSCRIPT : DH5Obj {
	mixin(H5This!("NOSCRIPT"));
}
mixin(FuncH5!"NOSCRIPT");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5NOSCRIPT == "<noscript></noscript>");
}
