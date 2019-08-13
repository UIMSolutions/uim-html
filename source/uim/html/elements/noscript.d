module uim.html.elements.noscript;

import uim.html;

class DH5NOScript : DH5Obj {
	mixin(H5This!("NOScript"));
}
mixin(FuncH5!"NOScript");

unittest {
	
	
	assert(H5NOScript == "<noscript></noscript>");
}
