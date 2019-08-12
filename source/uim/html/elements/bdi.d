module uim.html.elements.bdi;

import uim.html;

class DH5BDI : DH5Obj {
	mixin(H5This!"BDI");
}
mixin(FuncH5!"BDI");

unittest {
	

	mixin(H5Test!("H5BDI", "bdi"));
}

