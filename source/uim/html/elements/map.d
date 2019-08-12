module uim.html.elements.map;

import uim.html;

class DH5MAP : DH5Obj {
	mixin(H5This!("MAP"));
}
mixin(FuncH5!"MAP");

unittest {
	
	
	assert(H5MAP == "<map></map>");
}
