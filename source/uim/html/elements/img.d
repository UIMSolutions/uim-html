module uim.html.elements.img;

import uim.html;

class DH5Img : DH5Obj {
	mixin(H5This!("img", null, null, true));
}
mixin(FuncH5!("Img"));

unittest {
	
	
	assert(H5Img == "<img>");
}
