module uim.html.elements.bdi;

import uim.html;

class DH5Bdi : DH5Obj {
	mixin(H5This!"bdi");
}
mixin(FuncH5!"Bdi");

unittest {
	mixin(H5Test!("H5Bdi", "bdi"));
}

