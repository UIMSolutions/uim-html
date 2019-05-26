module uim.html.elements.details;

import uim.html;

class DH5DETAILS: DH5Obj {
	mixin(H5This!"DETAILS");
}
mixin(FuncH5!"DETAILS");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5DETAILS == "<details></details>");
}
