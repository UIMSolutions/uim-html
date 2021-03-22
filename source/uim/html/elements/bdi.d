module uim.html.elements.bdi;

import uim.html;

@safe class DH5Bdi : DH5Obj {
	mixin(H5This!"bdi");
}
mixin(H5Short!"Bdi");

unittest {
	mixin(H5Test!("H5Bdi", "bdi"));
}

