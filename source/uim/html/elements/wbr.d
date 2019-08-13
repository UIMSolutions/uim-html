module uim.html.elements.wbr;

import uim.html;

class DH5Wbr : DH5Obj {
	mixin(H5This!"wbr");
}
mixin(FuncH5!"Wbr");

unittest {
	mixin(H5Test!("H5Wbr", "wbr"));
}
