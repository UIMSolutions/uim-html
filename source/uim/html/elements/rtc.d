module uim.html.elements.rtc;

import uim.html;

class DH5Rtc : DH5Obj {
	mixin(H5This!"rtc");
}
mixin(FuncH5!"Rtc");

unittest {
	assert(H5Rtc == "<rtc></rtc>");
}
