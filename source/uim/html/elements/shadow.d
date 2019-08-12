module uim.html.elements.shadow;

import uim.html;

class DH5SHADOW : DH5Obj {
	mixin(H5This!("SHADOW"));
}
mixin(FuncH5!"SHADOW");

unittest {
	
	
	assert(H5SHADOW == "<shadow></shadow>");
}
