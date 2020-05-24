module uim.html.elements.code;

import uim.html;

class DH5Code : DH5Obj {
	mixin(H5This!"code");
}
mixin(H5Short!"Code");

unittest {
	assert(Assert(H5Code,"<code></code>"));
}
