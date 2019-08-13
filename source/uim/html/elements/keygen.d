module uim.html.elements.keygen;

import uim.html;

class DH5Keygen : DH5Obj {
	mixin(H5This!"keygen");
}
mixin(FuncH5!"Keygen");

unittest {
	
	
	assert(H5Keygen == "<keygen></keygen>");
}
