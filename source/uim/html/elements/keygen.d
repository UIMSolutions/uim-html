module uim.html.elements.keygen;

import uim.html;

class DH5KEYGEN : DH5Obj {
	mixin(H5This!"KEYGEN");
}
mixin(FuncH5!"KEYGEN");

unittest {
	
	
	assert(H5KEYGEN == "<keygen></keygen>");
}
