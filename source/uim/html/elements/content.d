module uim.html.elements.content;

import uim.html;

class DH5Content : DH5Obj {
	mixin(H5This!("content"));
}
mixin(FuncH5!"Content");

unittest {
	

	assert(H5Content == "<content></content>");
}
