﻿module uim.html.elements.textarea;

import uim.html;

class DH5Textarea : DH5Obj {
	mixin(H5This!"textarea");

	O cols(this O)(int value) { if (value > 0) attributes["cols"] = to!string(value); return cast(O)this; }
	O rows(this O)(int value) { if (value > 0) attributes["rows"] = to!string(value); return cast(O)this; }
}
mixin(H5Short!"Textarea");

unittest {
	assert(H5Textarea == "<textarea></textarea>");
}
