module uim.html.elements.b;

import uim.html;

/*
 * The <b> tag specifies bold text.*/

class DH5B : DH5Obj {
	mixin(H5This!"B");
}	
mixin(FuncH5!"B");

unittest {
	

	assert(H5B == "<b></b>");
}

