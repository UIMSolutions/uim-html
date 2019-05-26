module uim.html.elements.bdi;

import uim.html;

class DH5BDI : DH5Obj {
	mixin(H5This!"BDI");
}
mixin(FuncH5!"BDI");

unittest {
	writeln("Testing ", __MODULE__);

	mixin(H5Test!("H5BDI", "bdi"));
}

