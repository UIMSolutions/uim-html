module uim.html.elements.img;

import uim.html;

class DH5IMG : DH5Obj {
	mixin(H5This!("IMG", null, null, true));
}
mixin(FuncH5!("IMG"));

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5IMG == "<img>");
}
