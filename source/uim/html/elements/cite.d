module uim.html.elements.cite;

import uim.html;

class DH5CITE : DH5Obj {
	mixin(H5This!"CITE");
}
mixin(FuncH5!"CITE");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5CITE == "<cite></cite>");
}

