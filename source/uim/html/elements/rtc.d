﻿module uim.html.elements.rtc;

import uim.html;

@safe class DH5Rtc : DH5Obj {
	mixin(H5This!"rtc");
}
mixin(H5Short!"Rtc");

unittest {
	assert(Assert(H5Rtc, "<rtc></rtc>"));
}
