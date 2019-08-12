module uim.html.elements.title;

import uim.html;

class DH5TITLE : DH5Obj {
	mixin(H5This!("TITLE"));
}
mixin(FuncH5!"TITLE");

unittest {
	
	
	assert(H5TITLE == "<title></title>");
}
