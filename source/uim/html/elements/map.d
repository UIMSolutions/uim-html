module uim.html.elements.map;

import uim.html;

class DH5Map : DH5Obj {
	mixin(H5This!("map"));
}
mixin(H5Short!"Map");

unittest {
	
	
	assert(H5Map == "<map></map>");
}
