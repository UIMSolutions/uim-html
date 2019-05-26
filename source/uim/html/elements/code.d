module uim.html.elements.code;

import uim.html;

class DH5CODE : DH5Obj {
	mixin(H5This!"CODE");
}
mixin(FuncH5!"CODE");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5CODE == "<code></code>");
}
