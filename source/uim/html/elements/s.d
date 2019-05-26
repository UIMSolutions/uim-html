module uim.html.elements.s;

import uim.html; 

class DH5S : DH5Obj {
	mixin(H5This!"S");
}
mixin(FuncH5!"S");

unittest {
	writeln("Testing ", __MODULE__);
	
	assert(H5S == "<s></s>");
}
