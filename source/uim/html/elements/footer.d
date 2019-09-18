module uim.html.elements.footer;

import uim.html;

class DH5Footer : DH5Obj {
	mixin(H5This!("Footer"));
}
mixin(H5Short!"Footer");

unittest {
	
	
	assert(H5Footer == "<footer></footer>");
}
