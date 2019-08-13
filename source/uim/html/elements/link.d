module uim.html.elements.link;

import uim.html;

class DH5Link : DH5Obj {
mixin(H5This!("link", null, null, true));
}
mixin(FuncH5!("Link"));

unittest {
	
	
	assert(H5Link == "<link>");
}
