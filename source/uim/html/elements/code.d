module uim.html.elements.code;

import uim.html;

class DH5Code : DH5Obj {
	mixin(H5This!"code");
}
mixin(FuncH5!"Code");

unittest {
	assert(H5Code == "<code></code>");
}
