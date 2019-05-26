module uim.html.elements.dfn;

import uim.html;

class DH5DFN : DH5Obj {
	mixin(H5This!"DFN");
}
mixin(FuncH5!"DFN");

unittest {
	writeln("Testing ", __MODULE__);

	assert(H5DFN == "<dfn></dfn>");
}
