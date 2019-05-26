module uim.html.elements.textarea;

import uim.html;

class DH5TEXTAREA : DH5Obj {
	mixin(H5This!"TEXTAREA");

	O cols(this O)(int value) { if (value > 0) attributes["cols"] = to!string(value); return cast(O)this; }
	O rows(this O)(int value) { if (value > 0) attributes["rows"] = to!string(value); return cast(O)this; }
}
mixin(FuncH5!"TEXTAREA");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5TEXTAREA == "<textarea></textarea>");
}
