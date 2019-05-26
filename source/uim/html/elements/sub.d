module uim.html.elements.sub;

import uim.html;

class DH5SUB : DH5Obj {
	mixin(H5This!"SUB");
}
mixin(FuncH5!"SUB");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5SUB == "<sub></sub>");
}
