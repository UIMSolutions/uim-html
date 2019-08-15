module uim.html.elements.footer;

import uim.html;

class DH5Footer : DH5Obj {
	mixin(H5This!("Footer"));
}
mixin(FuncH5!"Footer");

unittest {
	
	
	assert(H5Footer == "<footer></footer>");
}
